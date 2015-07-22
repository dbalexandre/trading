define("pages.bids.form", function () {
  var el,
      forwardFields,
      paymentType;

  var init = function (element) {
    el = element;

    forwardFields = el.find(".forward");
    paymentType = el.find("select[name$='[payment_type]']");
    paymentType.on("change", onChangePaymentType);
    paymentType.trigger("change");
  };

  var onChangePaymentType = function () {
    var value = $(this).val();

    if (value === "forward") {
      showFields(forwardFields);
    } else {
      hideFields(forwardFields);
    }
  };

  var showFields = function(fields) {
    for (var i = 0; i < fields.length; i++) {
      $(fields[i]).show();
    }
  };

  var hideFields = function(fields) {
    for (var i = 0; i < fields.length; i++) {
      $(fields[i]).hide()
                  .find("input")
                  .val("");
    }
  };

  return {
    init: init
  };
});
