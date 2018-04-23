ptCloud = pcread('teapot.ply');
pcshow(ptCloud);
pcwrite(ptCloud,'teapotOut','PLYFormat','binary');