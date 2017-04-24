from behave import given
from selenium.common.exceptions import StaleElementReferenceException


def advance(context, max_attempts=3):
    attempts = 1
    while True:
        try:
            for button in context.browser.find_by_css(
                    'ul.pager a.next-button'):
                if button.visible:
                    button.click()
                    return
            return
        except StaleElementReferenceException:
            if attempts == max_attempts:
                raise
            attempts += 1


def fill_in_minimum_houghton(context):
    context.browser.choose('q1', '1')
    context.browser.choose('q2', '1')
    context.browser.choose('q3', '1')
    context.browser.choose('q4', '1')
    context.browser.choose('q5', '1')
    context.browser.choose('q6', '1')


def fill_in_minimum_balance_1(context):
    context.browser.choose('q23', '1')


def fill_in_minimum_balance_2(context):
    context.browser.find_by_id('q4-1')
    context.browser.choose('q24', '1')


def fill_in_minimum(context):
    fill_in_minimum_houghton(context)
    advance(context)
    # ABCs default to 0
    advance(context)
    fill_in_minimum_balance_1(context)
    advance(context)
    fill_in_minimum_balance_2(context)
    advance(context)


def goto_survey(context):
    context.browser.visit(context.browser_url("/"))


def submit_survey(context):
    context.browser.find_by_id('submit-button').first.click()


@given(u'I am on the survey')
def i_am_on_the_survey(context):
    context.browser.visit(context.browser_url("/"))
