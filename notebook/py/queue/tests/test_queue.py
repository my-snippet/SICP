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

    def test_enqueue_when_empty(self):
        """
        First node should be equal to last node
        """
        queue = Queue()
        item = 'a'
        queue.enqueue(item)
        self.assertEqual(queue._first.item, item)
        self.assertEqual(queue._first.item, queue._last.item)

    def test_enqueue_when_not_empty(self):
        """
        1) Last node should contaions inserted item
        2) First node should access next node
        """
        queue = Queue()
        item1, item2 = 'a', 'b'
        queue.enqueue(item1)
        queue.enqueue(item2)
        self.assertEqual(queue._first.item, item1)
        self.assertEqual(queue._first.next.item, queue._last.item)
