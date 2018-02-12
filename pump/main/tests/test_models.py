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
        self.assertEqual(results['percentage_positive'], '4.4')
        self.assertFalse(results['over_55'])
        self.assertFalse(results['r1'])
        self.assertFalse(results['r2'])
        self.assertFalse(results['r3'])
        self.assertFalse(results['r4'])
        self.assertFalse(results['r5'])
        self.assertFalse(results['r6'])
        self.assertFalse(results['r7'])
        self.assertFalse(results['r8'])
        self.assertFalse(results['r9'])
        self.assertFalse(results['r10'])
        self.assertFalse(results['r11'])
        self.assertFalse(results['r12'])
        self.assertFalse(results['r13'])
        self.assertFalse(results['r14'])
        self.assertFalse(results['r15'])
        self.assertFalse(results['r16'])

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
            age="55-64",
            r1="2+",
            r2="yes",
            r3="yes",
            r4="yes",
            r5="yes",
            r6="yes",
            r7="yes",
            r8="yes",
            r9="yes",
            r10="yes",
            r11="yes",
            r12="yes",
            r13="yes",
            r14="yes",
            r15="yes",
            r16="yes",
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
        self.assertEqual(results['percentage_positive'], '40.7')
        self.assertTrue(results['over_55'])
        self.assertTrue(results['r1'])
        self.assertTrue(results['r2'])
        self.assertTrue(results['r3'])
        self.assertTrue(results['r4'])
        self.assertTrue(results['r5'])
        self.assertTrue(results['r6'])
        self.assertTrue(results['r7'])
        self.assertTrue(results['r8'])
        self.assertTrue(results['r9'])
        self.assertTrue(results['r10'])
        self.assertTrue(results['r11'])
        self.assertTrue(results['r12'])
        self.assertTrue(results['r13'])
        self.assertTrue(results['r14'])
        self.assertTrue(results['r15'])
        self.assertTrue(results['r16'])

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
