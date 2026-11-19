// Copyright (c) 2021, Frappe Technologies Pvt. Ltd. and contributors
// For license information, please see license.txt

frappe.ui.form.on('PMS Calendar', {
	onload: function(frm){
		set_default_field_value(frm)
	},
	refresh:function(frm){
		disable_fields(frm)
	},
	fiscal_year: function(frm){
		set_default_field_value(frm)
	}
});

function disable_fields(frm){
//disable fields after save
	if (frm.doc.docstatus === 1){
		open_extension(frm)
		cur_frm.set_df_property("target_start_date", "read_only", 1);
		cur_frm.set_df_property("target_end_date", "read_only", 1);
		cur_frm.set_df_property("review_start_date", "read_only", 1);
		cur_frm.set_df_property("review_end_date", "read_only", 1);
		cur_frm.set_df_property("evaluation_start_date", "read_only", 1);
		cur_frm.set_df_property("evaluation_end_date", "read_only", 1);
	}
}

function open_extension(frm){
//if need to extend open pms extension doc
	frm.add_custom_button('Extend', () => {
		frappe.model.open_mapped_doc({
			method: "integrasuite.pms.doctype.pms_calendar.pms_calendar.create_pms_extension",	
			frm: cur_frm
		});
	})
}

// function set_default_field_value(frm){
// //set default field base on fiscal year
// 	if ( frm.doc.fiscal_year && frm.doc.docstatus !== 1){
// 		frm.set_value("target_start_date",frm.doc.fiscal_year);
// 		frm.set_value("target_end_date",frappe.datetime.add_days(frm.doc.fiscal_year,30));
// 		frm.set_value("review_start_date",frappe.datetime.add_months(frm.doc.fiscal_year,5));
// 		frm.set_value("review_end_date",frappe.datetime.add_days(frm.doc.review_start_date,29));
// 		frm.set_value("evaluation_start_date",frappe.datetime.add_months(frm.doc.fiscal_year,11));
// 		frm.set_value("evaluation_end_date",frappe.datetime.add_days(frm.doc.evaluation_start_date,30));
// 	}
// }
async function set_default_field_value(frm) {

    if (!frm.doc.fiscal_year || frm.doc.docstatus === 1) {
        return;
    }

    const selected_fiscal_year = frm.doc.fiscal_year;

    // Fetch actual dates from Fiscal Year
    const r = await frappe.db.get_value(
        "Fiscal Year",
        selected_fiscal_year,
        ["year_start_date", "year_end_date"]
    );

    if (frm.doc.fiscal_year !== selected_fiscal_year) {
        return;
    }

    const fiscal_year = r.message;

    if (!fiscal_year || !fiscal_year.year_start_date ||
        !fiscal_year.year_end_date) {
        frappe.msgprint(__("Fiscal Year dates not found"));
        return;
    }

    const start_date = fiscal_year.year_start_date;
    const end_date = fiscal_year.year_end_date;

    // Calculate periods dynamically
    function get_period(month_offset) {
        const period_start = frappe.datetime.add_months(
            start_date, month_offset
        );

        const next_month = frappe.datetime.add_months(
            start_date, month_offset + 1
        );

        const period_end = frappe.datetime.add_days(
            next_month, -1
        );

        return {
            start: period_start,
            end: period_end > end_date ? end_date : period_end
        };
    }

    const target = get_period(0);
    const review = get_period(5);
    const evaluation = get_period(11);

    await frm.set_value({
        target_start_date: target.start,
        target_end_date: target.end,

        review_start_date: review.start,
        review_end_date: review.end,

        evaluation_start_date: evaluation.start,
        evaluation_end_date: evaluation.end
    });
}