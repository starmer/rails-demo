// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
	$('.flash').remove();
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

jQuery.fn.editInPlace = function() {
	var id = this.attr("id");
	var item_id = id.substring(0,id.indexOf("-view"));
	var edit = $("#" + item_id + "-edit");
	var view = $("#" + item_id + "-view");
	var cancel = $("#" + item_id + "-cancel");
	var deleteLink = $("#" + item_id + "-delete");
	
  	this.mouseover(function(){
		$(this).addClass("edit");
	});
	this.mouseout(function(){
		$(this).removeClass("edit");
	});
	cancel.click(function(){
		view.show();
		edit.hide();
		return false;
	});
	view.dblclick(function() {
		edit.show();
		view.hide();	
    	return false;
	});
	deleteLink.click(function(){
		if(confirm("Are you sure you want to delete this Item?")){
			$('.flash').remove();
			$.ajax({
				url: this.href,
				success: function() {}
			});
		}

        return false;
	});
	
	
  return this;
};

jQuery.fn.archive = function() {
	var form = this.closest("form");
	var item_id = /[0-9]+/(form.attr("id"));
	
	this.click(function(){
		form.submit();
		return false;
	});
};

function setupListEditInPlace(){
	$("#list-cancel").click(function(){
		$("#list-view").show();
		$("#list-edit").hide();
		return false;
	});
	$("#list-view").dblclick(function() {
		$("#list-edit").show();
		$("#list-view").hide();	
    	return false;
	});
}

$(document).ready(function() {
	
	$("#item-form").submitWithAjax();
	$("#list-form").submitWithAjax();
	
	/* live query? */
	$(".edit_item").submitWithAjax();
	$(".item-view").each(function(i){
		$(this).editInPlace();
	});
	
	$(".archive_checkbox_form").submitWithAjax();
	$(".archive_item_checkbox").each(function(){
		$(this).archive();
	});
	
	$(".focus").focus();
	
	setupListEditInPlace();
});