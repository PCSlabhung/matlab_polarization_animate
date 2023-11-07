beta = 1;
t = 0;
omega = 2 * pi;
x = -2*pi:0.01:2*pi;
writerObj = VideoWriter('test.avi');
open(writerObj);
for i = 1:100
    z = cos(omega*t - k * x);
    y = sin(omega*t - k * x);
    plot3(x,y,z);
    %axis([0 15 -2 2]);
    hold on;
    mov = getframe(gcf);
    frames(i) = getframe(gcf);
    writeVideo(writerObj, mov);
    pause(0.1);
    t = t + 0.1;
    hold off;
end
close(writerObj);
dt = 0.1;
for i=1:100
    [image,map]=frame2im(frames(i));
    [im,map2]=rgb2ind(image,128);
    if i==1
        imwrite(im,map2,'move_pic.gif','gif','writeMode','overwrite','delaytime',dt,'loopcount',inf);
    else
        imwrite(im,map2,'move_pic.gif','gif','writeMode','append','delaytime',dt);
    end
end