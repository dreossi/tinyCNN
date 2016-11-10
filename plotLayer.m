function [ ] = plotLayer( x, layer_num, num_lays,scale, label )
%PLOTLAYER plot the matrices of a layer
   % 
   % x : matrices to be plotted
   % layer_num : layer number
   % scale : scale factor for plots
   
   MAX_VAL = 63;
   
   colormap('winter')
   cmp = colormap;
   
   hold on
   
   if strcmp(label,'input')
       subplot(length(x),num_lays,num_lays+1);
       imshow(scaleUp(x{1}/max(max(x{1}))*MAX_VAL,scale),cmp);
       xlabel(label);
       hold off
       return
   end
   
   if strcmp(label,'fully')
       span = [];
       for i=1:length(x)
           span = [span num_lays*i];
       end
       subplot(length(x),num_lays,span);
       imshow(scaleUp(x'/max(x)*MAX_VAL,scale),cmp);
       xlabel(label);
       hold off
       return
   end
   
   for i=1:length(x)
       subplot(length(x),num_lays,layer_num+(i-1)*num_lays);
       imshow(scaleUp(x{i}/max(max(x{i}))*MAX_VAL,scale),cmp);
   end
   xlabel(label);
   
   hold off
end

