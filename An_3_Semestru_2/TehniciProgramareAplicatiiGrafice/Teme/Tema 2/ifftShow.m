function [] = ifftShow(f,figNr)
    f1 = abs(f);
    fm = max(f1(:));
    figure(figNr); imshow(f1/fm);
end

