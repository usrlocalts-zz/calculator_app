var Calculator = function (viewId) {
    this.viewElement = $(viewId).clone().appendTo(".calculatorsBody");
    this.commandElement = this.viewElement.find(".command");
    this.submitButtonElement = this.viewElement.find(".submit");
    this.resultElement = this.viewElement.find(".result");
    console.log(this.submitButtonElement);
    this.created = false;
    this.observers = $({});
    this.initialize();
};
Calculator.prototype = {
    initialize: function () {
        this.observeButtonClick();
    },
    observeButtonClick: function () {
        this.submitButtonElement.click(_.bind(this.operationOnClick, this));
    },

    operationOnClick: function () {
        console.log("Calculator created");
        if (!this.created) {
            this.created = true;
            this.create();
        }

        this.update();

    },
    create: function () {
        $.ajax({
            url: "/api/calculator_create",
            method: "POST"
        });
    },

    update: function () {
        var command = this.commandElement.val();
        var self = this;
        $.ajax({
            url: "/api/calculator_update",
            method: "PUT",
            data: {command: command}

        }).success(_.bind(self.handleNotifyEvent, self));

    },
    handleNotifyEvent: function (result) {
        this.display(result.state);
        this.notifyObservers(result);

    },

    handleUpdated: function (event, result) {
        console.log(this);
        this.display(result.state);
    },
    display: function (result) {
        this.resultElement.append("<div>" + result + "</div>");
    },

    registerObservers: function (otherCalculator) {
        this.observers.on("CalculatorUpdated", _.bind(otherCalculator.handleUpdated, otherCalculator));
    },

    notifyObservers: function (result) {
        this.observers.trigger("CalculatorUpdated", result);
    }

};

$(document).ready(function () {
    var calculators = [];
    $(".addCalculator").click(function () {
        var calculator = new Calculator("#templates .calculator");
        $.each(calculators, function (index, value) {
            value.registerObservers(calculator);
            calculator.registerObservers(value);
        });

        calculators.push(calculator);


    });


});
