english_chars = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K,','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];

class PhysicalInfo:
    def set_date(self, date):
        if not isinstance(date, str):
            raise ValueError('Date must be valid')
        
        parts = date.split('-')

        if len(parts) != 3:
            raise ValueError('Date must be valid')

        if not parts[0].isdigit() or not parts[1].isdigit() or not parts[2].isdigit():
            raise ValueError('Date must be valid')
        
        month = int(parts[0])
        day = int(parts[1])
        year = int(parts[2])

        if year < 1900 or year > 2100:
            raise ValueError('Year must be between 1900 and 2100 inclusive')

        if month < 1 or day < 1:
            raise ValueError('Date must be valid')

        if month > 12:
            # assume european format, DD-MM-YYYY, swap values
            temp = month
            month = day
            day = temp
        
        if month > 12 or day > 31:
            raise ValueError('Date must be valid')

        self.date = date
    
    def set_name(self, name):
        if not isinstance(name, str):
            raise ValueError('Name must be a string')
        
        alnum = 0
        english = 0
        for c in name:
            if c.isalnum():
                alnum = alnum + 1
            if any(c in word for word in english_chars):
                english = english + 1
            if not c.isalnum() and c != ' ' and c != '-':
                raise ValueError('Name can only contain alphanumeric, space, or dash characters')
        
        if alnum < 2:
            raise ValueError('Name must have at least two alphanumeric characters')
        if english < 1:
            raise ValueError('Name must have at least one character from English alphabet')

        self.name = name

    def set_gender(self, gender):
        if not isinstance(gender, str):
            raise ValueError('Gender must be a string')

        if gender != 'M' and gender != 'F':
            raise ValueError('Gender must either be \'M\' or \'F\'')

        self.gender = gender
    
    def set_height(self, height):
        if not isinstance(height, int):
            raise ValueError('Height must be an integer')

        if height > 84 or height < 17:
            raise ValueError('Height must be a number of inches between 17 and 84 inclusive')

        self.height = height
    
    def set_temperature(self, temp):
        if not isinstance(temp, float):
            raise ValueError('Temperature must be a float')

        if temp > 104 or temp < 95:
            raise ValueError('Temperature must be a measurement in Fahrenheit between 95 and 104 inclusive')

        self.temp = temp
