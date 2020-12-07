import impl
import unittest

class TestPhysicalInfo(unittest.TestCase):
    def setUp(self):
        self.info = impl.PhysicalInfo()
    
    def test_name_valid(self):
        self.assertEqual(None, self.info.set_name('John é Smith'))
        self.assertEqual(None, self.info.set_name('John-Smith2'))
        self.assertEqual(None, self.info.set_name('  a2----'))
        self.assertEqual(None, self.info.set_name('af'))
        self.assertEqual(None, self.info.set_name('  - dc '))
        self.assertEqual(None, self.info.set_name('12f345'))
        self.assertEqual(None, self.info.set_name('éééu'))
    
    def test_name_invalid(self):
        self.assertRaises(ValueError, self.info.set_name, 'John é. Smith')
        self.assertRaises(ValueError, self.info.set_name, '  a%2----')
        self.assertRaises(ValueError, self.info.set_name, '')
        self.assertRaises(ValueError, self.info.set_name, '  -  ')
        self.assertRaises(ValueError, self.info.set_name, '12345')
        self.assertRaises(ValueError, self.info.set_name, 12345)
        self.assertRaises(ValueError, self.info.set_name, 123.45)
        self.assertRaises(ValueError, self.info.set_name, 'ééé')
        self.assertRaises(ValueError, self.info.set_name, None)
    
    def test_gender_valid(self):
        self.assertEqual(None, self.info.set_gender('M'))
        self.assertEqual(None, self.info.set_gender('F'))
    
    def test_gender_invalid(self):
        self.assertRaises(ValueError, self.info.set_gender, 'A')
        self.assertRaises(ValueError, self.info.set_gender, 1)
        self.assertRaises(ValueError, self.info.set_gender, 'M ')
        self.assertRaises(ValueError, self.info.set_gender, 'abc')
        self.assertRaises(ValueError, self.info.set_gender, 'MM')
        self.assertRaises(ValueError, self.info.set_gender, None)
    
    def test_height_valid(self):
        self.assertEqual(None, self.info.set_height(17))
        self.assertEqual(None, self.info.set_height(84))
        self.assertEqual(None, self.info.set_height(53))
    
    def test_height_invalid(self):
        self.assertRaises(ValueError, self.info.set_height, '20')
        self.assertRaises(ValueError, self.info.set_height, 60.5)
        self.assertRaises(ValueError, self.info.set_height, 12)
        self.assertRaises(ValueError, self.info.set_height, 90)
        self.assertRaises(ValueError, self.info.set_height, None)
    
    def test_temperature_valid(self):
        self.assertEqual(None, self.info.set_temperature(95.0))
        self.assertEqual(None, self.info.set_temperature(98.6))
        self.assertEqual(None, self.info.set_temperature(100.5))
        self.assertEqual(None, self.info.set_temperature(104.0))
    
    def test_temperature_invalid(self):
        self.assertRaises(ValueError, self.info.set_temperature, 94)
        self.assertRaises(ValueError, self.info.set_temperature, 94.99)
        self.assertRaises(ValueError, self.info.set_temperature, 105)
        self.assertRaises(ValueError, self.info.set_temperature, 104.01)
        self.assertRaises(ValueError, self.info.set_temperature, '98.6')
        self.assertRaises(ValueError, self.info.set_temperature, None)
    
    def test_date_valid(self):
        self.assertEqual(None, self.info.set_date('10-31-2020'))
        self.assertEqual(None, self.info.set_date('31-10-2020'))
        self.assertEqual(None, self.info.set_date('11-31-2020'))
        self.assertEqual(None, self.info.set_date('1-1-2000'))
        self.assertEqual(None, self.info.set_date('01-01-2000'))
        self.assertEqual(None, self.info.set_date('01-01-1900'))
        self.assertEqual(None, self.info.set_date('12-31-2100'))
        self.assertEqual(None, self.info.set_date('31-12-2100'))
    
    def test_date_invalid(self):
        self.assertRaises(ValueError, self.info.set_date, 15)
        self.assertRaises(ValueError, self.info.set_date, 15.5)
        self.assertRaises(ValueError, self.info.set_date, 'test')
        self.assertRaises(ValueError, self.info.set_date, '10/31/2020')
        self.assertRaises(ValueError, self.info.set_date, '31-25-2012')
        self.assertRaises(ValueError, self.info.set_date, '12-31-1899')
        self.assertRaises(ValueError, self.info.set_date, '5-5-5')
        self.assertRaises(ValueError, self.info.set_date, '1-1-2101')
        self.assertRaises(ValueError, self.info.set_date, '57-282-2012')
        self.assertRaises(ValueError, self.info.set_date, None)

if __name__ == '__main__':
    unittest.main()