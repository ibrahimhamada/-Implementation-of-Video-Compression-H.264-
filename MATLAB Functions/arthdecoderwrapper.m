function [frames] = arthdecoderwrapper(total_code,prop,symbol)

frame_stop = find(frames_decode_file == 1000);
frames = [];
for i=1:length(frame_stop)
    if i == 1
        code = frames_decode_file(1:frame_stop(i)-1);
        word = arthdecoder(code,symbols,props,5);
    else if i == length(frame_stop)
        code = frames_decode_file(frame_stop(i-1)+1:frame_stop(i)-1);
        word = arthdecoder(code,symbols,props,5);
    else
        code = frames_decode_file(frame_stop(i-1)+1:frame_stop(i)-1);
        word = arthdecoder(code,symbols,props,5);
    end
   frames = [frames word];
end

end