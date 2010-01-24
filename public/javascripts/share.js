function updateTips(t) {
	tips.html(t);
	//tips.text(t).effect("highlight",{},1500);
}

function checkLength(o,n,min,max) {
	if ( o.val().length > max || o.val().length < min ) {
		o.addClass('ui-state-error');
		updateTips("Length of " + n + " must be between "+min+" and "+max+".");
		return false;
	} else {
		return true;
	}
}

function checkRegexp(o,regexp,n) {
	if ( !( regexp.test( o.val() ) ) ) {
		o.addClass('ui-state-error');
		updateTips(n);
		return false;
	} else {
		return true;
	}
}

var allFields;
var tips;
var share_id = null;

$j(function() {
	// http://jqueryui.com/demos/dialog/
	$j("#dialog_share_by_email").dialog({
		bgiframe: true,
		autoOpen: false,
		height: 360,
		width:360,
		modal: true,
		open: function() {
			//
			var email = $j("#dialog_share_by_email_email");
			allFields = $j([]).add(email);
			tips = $j("#validateTips");
			//
			//$j("#dialog_share_by_email_name").val("");
			$j("#dialog_share_by_email_email").val("");
			$j("#dialog_share_by_email_message").val("");
		},
		buttons: {
			'Send': function() {
				//
				
				var bValid = true;
				allFields.removeClass('ui-state-error');

				var name = $j("#dialog_share_by_email_name");
				var email = $j("#dialog_share_by_email_email");
				var message = $j("#dialog_share_by_email_message");
				//
				bValid = bValid && checkLength(email,"email",6,80);
				bValid = bValid && checkRegexp(email,/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i,"Enter a valid email.");

				if (bValid) {
					// ajax call
					var letter_id = share_id.replace("letter-id-", "");
					$j("#dialog_share_by_email_letter_id").val(letter_id);
					
					//
					var that = this;
					//
					
					var data = $j("#dialog_share_by_email_form").serialize();
					$j.ajax({
					   type: "POST",
					   url: "/letters/share_email",
					   data: data,
					   success: function(msg){
					   		alert(msg);
					     $j(that).dialog('close');
					   }
					});
				} else {
				}
			},
			Cancel: function() {
				$j(this).dialog('close');
			}
		},
		close: function() {
			//
			share_id = null;
			//
			allFields.val('').removeClass('ui-state-error');
			//
			updateTips("");
		}
	});
	
	$j('.share_by_email').click(function() {
		share_id = this.id;
		$j('#dialog_share_by_email').dialog('open');
	})
});