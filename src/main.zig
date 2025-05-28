const std = @import("std");
const print = std.debug.print;

const Node = struct {
    value: u8,
    next: ?*Node = null,

    pub fn print_value(self: Node) void {
        print("Value: {d}\n", .{self.value});
    }
};


pub fn main() void {

    var node1: Node = .{
        .value = 42,
    };

    var node2: Node = .{
        .value = 69,
    };

    var node3: Node = .{
        .value = 46,
    };

    var node4: Node = .{
        .value = 11,
    };
    
    // Link nodes
    node1.next = &node2;
    node2.next = &node3;
    node3.next = &node4;

    // Go through the nodes
    var count: u8 = 1;
    var head: ?*Node = &node1;

    while (true) {
        print("Now on node #{d}: ", .{count});
        head.?.*.print_value();
        
        head = head.?.*.next orelse break;
        
        count += 1;
    }

    print("Nodes visited: {d}\n", .{count});
}
