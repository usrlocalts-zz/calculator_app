var Calculator = function (viewId) {
    this.viewElement = $(viewId);
    this.commandElement = this.viewElement.find(".command");
    this.submitButtonElement = this.viewElement.find(".submit");
    this.resultElement = this.viewElement.find(".result");
    this.created = false;
    this.observers = $({});
    this.initialize();
}
Calculator.prototype = {
    initialize: function () {
        this.observeButtonClick();
    },
    observeButtonClick: function () {
        this.submitButtonElement.click(_.bind(this.operationOnClick, this));
    },

    operationOnClick: function () {
        if (!this.created) {
            this.created = true;
            this.create();
        }
        this.update();
        this.notifyObservers();
    },
    create: function () {
        $.ajax({
            url: "/api/calculator_create",
            method: "POST"
        })
    },

    update: function () {
        var command = this.commandElement.val();
        var self = this;
        $.ajax({
            url: "/api/calculator_update",
            method: "PUT",
            data: {command: command},
            success: function (data) {
                self.display(data.state);
            }

        })
    },
    updated: function () {
        var command = "";
        var self = this;
        $.ajax({
            url: "/api/calculator_update",
            method: "PUT",
            data: {command: command},
            success: function (data) {
                self.display(data.state);
            }

        })
    },
    display: function (result) {
        this.resultElement.append("<div>" + result + "</div>");
    },

    registerObservers: function (otherCalculator) {
        this.observers.on("CalculatorUpdated", _.bind(otherCalculator.updated, otherCalculator));
    },

    notifyObservers: function(){
        this.observers.trigger("CalculatorUpdated");
    }

}

$(document).ready(function () {
    var calculator = new Calculator("#calculator")
    var calculator1 = new Calculator("#calculator-1")
    calculator.registerObservers(calculator1);
    calculator1.registerObservers(calculator);
})