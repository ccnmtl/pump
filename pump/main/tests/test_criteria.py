from unittest import TestCase
from pump.main.criteria import Houghton, ABC, PassFail


class TestHoughton(TestCase):
    def test_normal(self):
        h = Houghton([1, 2, 3, 1, 1, 1])
        self.assertEqual(h.score(), 9)
        self.assertEqual(h.category(),
                         "indepenedent community walking ability")
        self.assertTrue(h.pass_fail())

    def test_fail(self):
        h = Houghton([1, 1, 1, 1, 1, 1])
        self.assertEqual(h.score(), 6)
        self.assertEqual(h.category(),
                         "limited community/independent "
                         "household walking ability")
        self.assertFalse(h.pass_fail())

    def test_total_fail(self):
        h = Houghton([0, 0, 0, 0, 0, 0])
        self.assertEqual(h.score(), 0)
        self.assertEqual(h.category(),
                         "limited household walking ability")
        self.assertFalse(h.pass_fail())

    def test_pass(self):
        h = Houghton([4, 4, 4, 2, 2, 2])
        self.assertEqual(h.score(), 18)
        self.assertEqual(h.category(),
                         "indepenedent community walking ability")
        self.assertTrue(h.pass_fail())

    def test_barely(self):
        h = Houghton([1, 2, 2, 1, 1, 1])
        self.assertEqual(h.score(), 8)
        self.assertEqual(h.category(),
                         "limited community/independent "
                         "household walking ability")
        self.assertTrue(h.pass_fail())


class TestABC(TestCase):
    def test_normal(self):
        a = ABC([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16])
        self.assertEqual(a.score(), 136)
        self.assertTrue(a.pass_fail())

    def test_fail(self):
        a = ABC([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
        self.assertEqual(a.score(), 16)
        self.assertFalse(a.pass_fail())

    def test_high_pass(self):
        a = ABC([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                 10, 10, 10, 10, 10])
        self.assertEqual(a.score(), 160)
        self.assertTrue(a.pass_fail())

    def test_barely(self):
        a = ABC([7, 7, 7, 7, 7, 7, 7, 7, 6, 6, 6, 6, 6, 6, 6, 6])
        self.assertEqual(a.score(), 104)
        self.assertFalse(a.pass_fail())

        a = ABC([7, 7, 7, 7, 7, 7, 7, 7, 7, 6, 6, 6, 6, 6, 6, 6])
        self.assertEqual(a.score(), 105)
        self.assertTrue(a.pass_fail())


class TestPassFail(TestCase):
    def test_pass(self):
        p = PassFail(2)
        self.assertTrue(p.pass_fail())

    def test_fail(self):
        p = PassFail(1)
        self.assertFalse(p.pass_fail())
