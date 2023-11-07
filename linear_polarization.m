%beta = 2*pi/1;
%W = 2 * pi /1;
%x = linspace(-2,2,100);
%y = linspace(-2,2,100);
%[xxaxis, yyaxis] = meshgrid(x,y);
%zz = cos(beta.*xxaxis);
%mesh(xxaxis, yyaxis ,zz);

omega = 2*pi;
t = 0;
x = linspace(0,15,100);
y = zeros(size(x));
k = 1;
writerObj = VideoWriter('test.avi');
open(writerObj);
for i = 1:100
    z = cos(omega*t - k * x);
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
dt = 0.1;
close(writerObj);
for i=1:100
    [image,map]=frame2im(frames(i));
    [im,map2]=rgb2ind(image,128);
    if i==1
        imwrite(im,map2,'move_pic.gif','gif','writeMode','overwrite','delaytime',dt,'loopcount',inf);
    else
        imwrite(im,map2,'move_pic.gif','gif','writeMode','append','delaytime',dt);
    end
end