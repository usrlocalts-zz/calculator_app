var Calculators = function() {
    this.calculators = [];
};
Calculators.prototype= {

    addCalculator: function () {
        var calculator = new Calculator("#templates .calculator");
        this.addObservers(calculator);
        this.calculators.push(calculator);
    },
    addObservers: function (calculator) {
        $.each(this.calculators, function (index, otherCalculator) {
            otherCalculator.registerObservers(calculator);
            calculator.registerObservers(otherCalculator);
        });
    }


};