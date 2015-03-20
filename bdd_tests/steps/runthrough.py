from behave import when, then, given
import time


def advance(context):
    for button in context.browser.find_by_css('ul.pager a'):
        if button.text == "Next >" and button.visible:
            button.click()
            return


@given(u'I enter the minimum on all questions')
def i_enter_the_minimum_on_all_questions(context):
    context.browser.choose('q1', '1')
    context.browser.choose('q2', '1')
    context.browser.choose('q3', '1')
    context.browser.choose('q4', '1')
    context.browser.choose('q5', '1')
    context.browser.choose('q6', '1')
    advance(context)
    # ABCs default to 0
    advance(context)
    context.browser.choose('q23', '1')
    advance(context)
    context.browser.choose('q24', '1')
    advance(context)
    # ready to submit


@given(u'I enter the maximum on all questions')
def i_enter_the_maximum_on_all_questions(context):
    context.browser.choose('q1', '4')
    context.browser.choose('q2', '4')
    context.browser.choose('q3', '4')
    context.browser.choose('q4', '2')
    context.browser.choose('q5', '2')
    context.browser.choose('q6', '2')
    advance(context)
    # jquery UI sliders are a bit hard to automate
    # could probably do it with drag and drop
    # but this is simpler and seems reliable
    for i in range(1, 17):
        context.browser.execute_script(
            "$('#abc-%d-slider').slider('value', 10)" % i)
        context.browser.execute_script(
            "$('#abc-%d').val(10)" % i)
    time.sleep(5)
    advance(context)
    context.browser.choose('q23', '2')
    advance(context)
    context.browser.choose('q24', '2')
    advance(context)
    # ready to submit


@when(u'I submit')
def i_submit(context):
    context.browser.find_by_id('submit-button').first.click()


@then(u'I am shown a passing result')
def i_am_shown_a_passing_result(context):
    b = context.browser
    assert "PASS" in b.find_by_id('houghton-result').first.text
    assert "PASS" in b.find_by_id('abc-result').first.text
    assert "PASS" in b.find_by_id('pickup-result').first.text
    assert "PASS" in b.find_by_id('look-behind-result').first.text


@then(u'I am shown a failing result')
def i_ams_shown_a_failing_result(context):
    b = context.browser
    assert "FAIL" in b.find_by_id('houghton-result').first.text
    assert "FAIL" in b.find_by_id('abc-result').first.text
    assert "FAIL" in b.find_by_id('pickup-result').first.text
    assert "FAIL" in b.find_by_id('look-behind-result').first.text


@then(u'I see the results graph')
def i_see_the_results_graph(context):
    b = context.browser
    assert b.find_by_css('div.results-graph img')


@then(u'I see the additional resources section')
def i_see_the_additional_resources_section(context):
    b = context.browser
    assert b.find_by_id('additional-resources')


@then(u'I see that I have a "{percent}"% likelihood of being unsatisfactory')
def i_see_that_i_have_a_likelihood_of_being_unsatisfactory(context, percent):
    assert context.browser.is_text_present(
        "You have a %s%% likelihood of being an "
        "Unsatisfactory Community Prosthetic User* "
        "within one year" % percent)


@then(u'I see that I have passed "{n}" tests')
def i_see_that_i_have_passed_n_tests(context, n):
    assert context.browser.is_text_present(
        "You passed %s of the four diagnostic tests." % n)


@then(u'I see the definition of satisfactory user')
def i_see_the_definition_of_satisfactory_user(context):
    b = context.browser
    assert b.find_by_id('satisfactory-user')
