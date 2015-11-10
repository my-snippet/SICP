import unittest
from py.queue.queue import Queue


class TestQueue(unittest.TestCase):
    def setUp(self):
        self.queue = Queue()
        self.item1, self.item2 = 'a', 'b'

    # @unittest.skip("test")
    def test_make_queue(self):
        """
        Initial Queue
        1) First node, second node is initialized to 'None'
        2) Size should be zero. ( isEmpty() == True )
        """
        self.assertIsNone(self.queue._first)
        self.assertIsNone(self.queue._last)
        self.assertTrue(self.queue.isEmpty())

    def test_enqueue_when_empty(self):
        """
        First node should be equal to last node
        """
        self.queue.enqueue(self.item1)
        self.assertEqual(self.queue._first.item, self.item1)
        self.assertEqual(self.queue._first.item, self.queue._last.item)

    def test_enqueue_when_not_empty(self):
        """
        1) Last node should contaions inserted self.item
        2) First node should access next node
        """
        self.queue.enqueue(self.item1)
        self.queue.enqueue(self.item2)
        self.assertEqual(self.queue._size, 2)
        self.assertEqual(self.queue._first.item, self.item1)
        self.assertEqual(self.queue._first.next.item, self.queue._last.item)

    #def test_dequeue(self):

