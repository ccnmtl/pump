from django.test import TestCase
from .factories import ResponseFactory


class ResponseTest(TestCase):
    def test_unicode(self):
        r = ResponseFactory()
        self.assertTrue(str(r).startswith('Response'))

    def test_results_all_fail(self):
        r = ResponseFactory()
        results = r.results()
        self.assertTrue('houghton' in results)
        self.assertFalse(results['houghton'].pass_fail())
        self.assertTrue('abc' in results)
        self.assertFalse(results['abc'].pass_fail())
        self.assertTrue('pick_up' in results)
        self.assertFalse(results['pick_up'].pass_fail())
        self.assertTrue('look_behind' in results)
        self.assertFalse(results['look_behind'].pass_fail())
        self.assertEqual(results['number_passed'], 0)
        self.assertEqual(results['percentage_likelihood'], '95.6')

    def test_results_all_pass(self):
        r = ResponseFactory(
            # Houghton
            q1="4", q2="4", q3="4", q4="2", q5="2", q6="2",
            # ABC
            q7="10", q8="10", q9="10", q10="10", q11="10",
            q12="10", q13="10", q14="10", q15="10", q16="10",
            q17="10", q18="10", q19="10", q20="10", q21="10",
            q22="10",
            # pick up
            q23="2",
            # look behind
            q24="2",
        )
        results = r.results()
        self.assertTrue('houghton' in results)
        self.assertTrue(results['houghton'].pass_fail())
        self.assertTrue('abc' in results)
        self.assertTrue(results['abc'].pass_fail())
        self.assertTrue('look_behind' in results)
        self.assertTrue(results['look_behind'].pass_fail())
        self.assertEqual(results['number_passed'], 4)
        self.assertEqual(results['percentage_likelihood'], '59.3')

    def test_email_text(self):
        r = ResponseFactory()
        self.assertTrue("your results" in r.email_text())
        self.assertTrue("Houghton: FAIL (0/18)" in r.email_text())

    def test_email_text_pass(self):
        r = ResponseFactory(
            # Houghton
            q1="4", q2="4", q3="4", q4="2", q5="2", q6="2",
            # ABC
            q7="10", q8="10", q9="10", q10="10", q11="10",
            q12="10", q13="10", q14="10", q15="10", q16="10",
            q17="10", q18="10", q19="10", q20="10", q21="10",
            q22="10",
            # pick up
            q23="2",
            # look behind
            q24="2",
        )
        self.assertTrue("Houghton: PASS (18/18)" in r.email_text())
