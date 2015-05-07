;(function() {

    var Wizard = function(element, sectionSelector) {
        this.element = element;
        this.sectionSelector = sectionSelector;
        this.sections = $(this.sectionSelector);
        this.current = 0;
        this.questionsAnswered = [
           // 1 - 6 are houghton
           false, false, false, false, false, false,
           // 7 - 22 are abcs. the values don't matter
           false, false, false, false, false, false,
           false, false, false, false, false, false,
           false, false, false, false,
           // balance 1
           false,
           // balance 2
           false
        ];
        this.registerRadioListeners();
        this.hideAllSections();
        this.addNavButtons();
        $(this.sections[this.current]).show();
    };

    Wizard.prototype.allHoughtonQuestionsAnswered = function() {
        for (var i = 0; i < 6; i++) {
            if (!this.questionsAnswered[i]) {
                return false;
            }
        }
        return true;
    };

    Wizard.prototype.registerRadioListeners = function() {
        var self = this;

        var registerRadioListener = function(i) {
            $('input[name="q' + i + '"]').change(function(e) {
                self.questionsAnswered[i - 1] = $(this).is(':checked');
                if (self.allHoughtonQuestionsAnswered()) {
                    $('#next-button-0').removeAttr('disabled');
                }
                if (self.questionsAnswered[22]) {
                    $('#next-button-2').removeAttr('disabled');
                }
                if (self.questionsAnswered[23]) {
                    $('#next-button-3').removeAttr('disabled');
                }
            });
        };

        // register houghton listeners
        for (var i = 1; i <= 6; i++) {
            registerRadioListener(i);
        }
        // balance 1
        registerRadioListener(23);
        // balance 2
        registerRadioListener(24);
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
                    .attr({href:'#'}));
                pb.click(function() {
                    w.showPrevSection();
                    return false;
                });
                ul.append(pb);
            }
            if (index < (length - 1)) {
                var a = $('<a>Next &gt;</a>')
                    .attr({href:'#', class:'btn',
                           id:'next-button-' + index});
                if (index != 1) {
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
