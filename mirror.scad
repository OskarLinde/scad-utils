// Copyright (c) 2013 Oskar Linde. All rights reserved.
// License: BSD
//
// This library contains simple mirroring functions
//
// mirror_x()
// mirror_y()
// mirror_z()


module mirror_x() {
	union() {
		children(0);
		scale([-1,1,1]) children(0);
	}
}

module mirror_y() {
	union() {
		children(0);
		scale([1,-1,1]) children(0);
	}
}

module mirror_z() {
	union() {
		children(0);
		scale([1,1,-1]) children(0);
	}
}
