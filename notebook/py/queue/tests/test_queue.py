import unittest
from py.queue.queue import Queue


class TestQueue(unittest.TestCase):
    def setUp(self):
        pass

    # @unittest.skip("test")
    def test_make_queue(self):
        """
        Initial Queue
        1) First node, second node is initialized to 'None'
        2) Size should be zero. ( isEmpty() == True )
        """
        queue = Queue()

        self.assertIsNone(queue._first)
        self.assertIsNone(queue._last)
        self.assertTrue(queue.isEmpty())

    def test_enqueue(self):
        """
        1. Empty
            1) First node should be equal to last node
        2. Not empty
            1) Last node should contaions inserted item
            2) First node should access next node
        """
        # pass
        queue = Queue()
        item1, item2 = 'a', 'b'
        queue.insert_queue(item1)
        self.assertEqual(queue._first, item1)
        self.assertEqual(queue._first, queue._last)
