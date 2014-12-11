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
            var ul = $('<ul></ul>').addClass('pager');
            var row = $('<nav></nav>')
               .append(ul);
            if (index > 0) {
                var pb = $('<li></li>').append($('<a>&lt; Previous</a>')
                    .attr({href:'#'}));
                pb.click(function() {
                    w.showPrevSection();
                    return false;
                });
                ul.append(pb);
            }
            if (index < (length - 1)) {
                var nb = $('<li></li>').append($('<a>Next &gt;</a>')
                    .attr({href:'#'}));
                nb.click(function() {
                    w.showNextSection();
                    return false;
                });
                ul.append(nb);
            }
            $(element).append(row);
        });
    };

    window.Wizard = Wizard;

}());
