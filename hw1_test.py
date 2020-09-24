import hw1;

#####
###
### PART 1
###
#####

print("============");
print("===PART 1===");
print("============");

# test = 'abc';
# print("isValid('" + test + "') = " + str(hw1.isValid(test)))
# test = 'abcc';
# print("isValid('" + test + "') = " + str(hw1.isValid(test)))
# test = 'abccc';
# print("isValid('" + test + "') = " + str(hw1.isValid(test)))
test = 'aabbcd';
print(hw1.isValid(test));
test = 'aabbcdddeefghi';
print(hw1.isValid(test));
test = 'abcdefghhgfedecba';
print(hw1.isValid(test));

#####
###
### PART 2
###
#####

print("============");
print("===PART 2===");
print("============");

print(hw1.isBalanced('{[()]}'));
print(hw1.isBalanced('{[(])}'));
print(hw1.isBalanced('{{[[(())]]}}'));
print(hw1.isBalanced('{{(([])[])[]}[()]}'));
# print(hw1.isBalanced(']})({['));
# print(hw1.isBalanced('{[{(({{[]}}))}]}'));
# print(hw1.isBalanced('{[{({[{(({{[({{[]}})]}}))}]})}]}'));

#####
###
### PART 3
###
#####

print("============");
print("===PART 3===");
print("============");

root = hw1.Node(2, hw1.Node(1, hw1.Node(6), hw1.Node(3)), hw1.Node(3, None, hw1.Node(9)))
print(root.preOrder());
print(root.inOrder());
print(root.postOrder());
print(root.sumTree());

print(" ");

root = hw1.Node(1, hw1.Node(2, hw1.Node(3)), hw1.Node(4, None, (hw1.Node(5, None, hw1.Node(6, None, hw1.Node(7))))))
print(root.preOrder());
print(root.inOrder());
print(root.postOrder());
print(root.sumTree());