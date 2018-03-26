function [] = fftShow(f, figNr)
    f1 = log(1+abs(f));
    fm = max(f1(:));
    figure(figNr); imshow(im2uint8(f1/fm));
end

