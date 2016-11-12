function [ ] = plotCNN( cnn )
%PLOTCNN Plot the CNN   

   colormap('winter')   
   num_lays = length(cnn);
   
   hold on
    for i=1:num_lays
        
        layerType = cnn{i}.type;
        layer = cnn{i}.stack;
        
        switch layerType
            case 'fully'
                span = [];
                for i=1:length(layer)
                    span = [span num_lays*i];
                end
                subplot(length(layer),num_lays,span);
                myPlot(layer');
                xlabel(layerType);
            otherwise
                for j=1:length(layer)
                    subplot(length(layer),num_lays,i+(j-1)*num_lays);
                    myPlot(layer{j});
                end
                xlabel(layerType);
        end                
    end    
    hold off
end

