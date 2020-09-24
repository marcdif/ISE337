## ISE 337 Programming Assignment #1
## Marc DiFilippo
## 111420881
## Done on 9/23/20 at 6:20 PM EST

def isValid(s, secondPass=False):
    dictionary = {}
    for c in s:
        if c in dictionary:
            dictionary[c] = dictionary[c] + 1
        else:
            dictionary[c] = 1
    allSame = True
    size = None
    for k, v in dictionary.items():
        if size == None:
            size = v
        else:
            if size != v:
                allSame = False
                break;
    if allSame:
        return 'YES'
    else:
        if secondPass:
            return 'NO'
        largestKey = None
        largestValue = None
        for k, v in dictionary.items():
            if largestKey == None:
                largestKey = k
                largestValue = v
            else:
                if v > largestValue:
                    largestKey = k
                    largestValue = v
        dictionary[largestKey] = largestValue - 1
        newString = ''
        for k, v in dictionary.items():
            for i in range(v):
                newString += k
        return isValid(newString, True)

def isBalanced(string):
    length = len(string);
    if length % 2 == 1:
        return 'NO'
    stack = [];
    valid = True;
    for c in string:
        if c == '(' or c == '[' or c == '{':
            stack.append(c);
            valid = False;
        elif c == ')' or c == ']' or c == '}':
            if len(stack) == 0:
                valid = False;
                break;
            pop = stack.pop();
            if (pop == '(' and c == ')') or (pop == '[' and c == ']') or (pop == '{' and c == '}'):
                valid = True;
                continue;
            else:
                valid = False;
                break;
    if valid:
        return 'YES';
    else:
        return 'NO';

class Node:
    def __init__(self, label, left_child=None, right_child=None):
        self.label = label
        self.left_child = left_child
        self.right_child = right_child

    def isLeaf(self):
        return self.left_child == self.right_child == None

    def preOrder(tree, array=None):
        if array == None:
            array = [];
        array.append(tree.label)
        if tree.left_child is not None:
            Node.preOrder(tree.left_child, array)
        if tree.right_child is not None:
            Node.preOrder(tree.right_child, array)
        return array;

    def inOrder(tree, array=None):
        if array == None:
            array = [];
        if tree.left_child is not None:
            Node.inOrder(tree.left_child, array)
        array.append(tree.label)
        if tree.right_child is not None:
            Node.inOrder(tree.right_child, array)
        return array;

    def postOrder(tree, array=None):
        if array == None:
            array = [];
        if tree.left_child is not None:
            Node.postOrder(tree.left_child, array)
        if tree.right_child is not None:
            Node.postOrder(tree.right_child, array)
        array.append(tree.label)
        return array;

    def sumTree(root):
        array = root.preOrder();
        total = 0;
        for x in array:
            total += x;
        return total;
