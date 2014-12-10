;(function() {

    var Wizard = function(element, sectionSelector) {
        this.element = element;
        this.sectionSelector = sectionSelector;
        this.sections = $(this.sectionSelector);
        this.current = 0;
        this.hideAllSections();
        this.addNavButtons();
        $(this.sections[this.current]).show();
    };

    Wizard.prototype.hideAllSections = function() {
        this.sections.each(function(index, element) {
            $(element).hide();
        });
    };

    Wizard.prototype.showNextSection = function() {
        this.current++;
        this.hideAllSections();
        $(this.sections[this.current]).show();
    };

    Wizard.prototype.showPrevSection = function() {
        this.current--;
        this.hideAllSections();
        $(this.sections[this.current]).show();
    };

    Wizard.prototype.addNavButtons = function() {
        var w = this;
        var length = this.sections.length;
        this.sections.each(function(index, element) {
            if (index > 0) {
                var pb = $('<a>Previous</a>')
                    .attr({href:'#'})
                    .addClass('btn btn-primary');
                pb.click(function() {
                    w.showPrevSection();
                    return false;
                });
                $(element).append(pb);
            }
            if (index < (length - 1)) {
                var nb = $('<a>Next</a>')
                    .attr({href:'#'})
                    .addClass('btn btn-primary');
                nb.click(function() {
                    w.showNextSection();
                    return false;
                });
                $(element).append(nb);
            }
        });
    };

    window.Wizard = Wizard;

}());
