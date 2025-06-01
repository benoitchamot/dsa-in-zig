const std = @import("std");
const print = std.debug.print;

const Node = struct {
    value: u8,
    next: ?*Node = null,

    pub fn print_value(self: Node) void {
        print("Value: {d}\n", .{self.value});
    }
};

// FIX THIS: this is probably not the right way to return the pointer I need
pub fn createNode(allocator: *const std.mem.Allocator, value: u8) !*Node {

    const node: Node = .{
        .value = value,
    };

    // create = Returns a pointer to undefined memory. 
    // Call destroy with the result to free the memory
    const ptr = try allocator.create(Node);
    ptr.* = node;

    return ptr;
}


pub fn main() void {


    // initialize the allocator
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    // initialize the allocator
    const allocator = arena.allocator();

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
    node4.next = createNode(&allocator, 9);

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
