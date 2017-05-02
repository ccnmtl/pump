(function() {

    var allRadioButtonsSelected = function(radios) {
        var groups = {};
        radios.each(function(a) {
            groups[$(this).attr('name')] = 1;
        });
        var total = Object.keys(groups).length;
        var selected = radios.filter(function(index) {
            return $(this).is(':checked');
        });
        return total === selected.length;
    };

    var Wizard = function(element, sectionSelector) {
        this.element = element;
        this.sectionSelector = sectionSelector;
        this.sections = $(this.sectionSelector);
        this.current = 0;
        this.registerRadioListeners();
        this.hideAllSections();
        this.addNavButtons();
        $(this.sections[this.current]).show();
    };

    Wizard.prototype.registerRadioListeners = function() {
        var self = this;

        var registerRadioListener = function(section) {
            var radios = $(self.sections[section])
								.find('input[type="radio"]');
            radios.change(function(e) {
                if (allRadioButtonsSelected(radios)) {
                    $(self.sections[section])
                      .find('.next-button')
                      .removeAttr('disabled');
                }
            });
        };

        registerRadioListener(0);
        // register houghton listeners
        registerRadioListener(1);
        // ABCs section has no validation
        // balance 1
        registerRadioListener(3);
        // balance 2
        registerRadioListener(4);
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
        $('html, body').animate({
            scrollTop: 0
        }, 500);
    };

    Wizard.prototype.showPrevSection = function() {
        this.current--;
        this.hideAllSections();
        $(this.sections[this.current]).show();
        $('html, body').animate({
            scrollTop: 0
        }, 500);
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
                    .attr({href: '#'}));
                pb.click(function() {
                    w.showPrevSection();
                    return false;
                });
                ul.append(pb);
            }
            if (index < (length - 1)) {
                var a = $('<a>Next &gt;</a>')
                    .attr({href: '#', class: 'btn next-button',
                        id: 'next-button-' + index});
                if (index !== 1) {
                    // all sections except ABC need questions answered
                    // before you can advance
                    a.attr({disabled: 'disabled'});
                }
                var nb = $('<li></li>').append(a);

                nb.click(function(event) {
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
