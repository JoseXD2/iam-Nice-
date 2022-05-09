function onCreate()


	
	makeAnimatedLuaSprite('bgtheo', 'characters/theo', -320, -70);
	addAnimationByPrefix('bgtheo', 'idle', 'Theo idle', 12, false);
	scaleObject('bgtheo', 0.8, 0.8);
	setScrollFactor('bgtheo', 0.9, 0.9);
	objectPlayAnimation('bgtheo', 'idle');
	addLuaSprite('bgtheo', false);
	
	makeAnimatedLuaSprite('bgminji', 'characters/Minji', 1000, -70);
	addAnimationByPrefix('bgminji', 'danceLeft', 'Minji danceLeft', 12, false);
	addAnimationByPrefix('bgminji', 'danceRight', 'Minji danceRight', 12, false);
	addAnimationByPrefix('bgminji', 'snare', 'Minji fill_snare', 12, true);
	addAnimationByPrefix('bgminji', 'tom', 'Minji fill_tom', 12, false);
	addAnimationByPrefix('bgminji', 'cymbal', 'Minji fill_cymbal', 12, false);
	addAnimationByPrefix('bgminji', 'doubletime', 'Minji idle_doubletime', 12, false);
	addAnimationByPrefix('bgminji', 'rest', 'Minji rest', 12, false);
	addAnimationByPrefix('bgminji', 'shortcymbal', 'Minji fill_shortcymbal', 12, false);
	addAnimationByPrefix('bgminji', 'snarecrash', 'Minji fill_rollcrash', 12, false);
	scaleObject('bgminji', 0.8, 0.8);
	setScrollFactor('bgminji', 0.9, 0.9);
	objectPlayAnimation('bgminji', 'danceRight');
	addLuaSprite('bgminji', false); -- false = add behind characters, true = add over characters

	makeAnimatedLuaSprite('bgsis', 'bgsis', 750, -50);
	addAnimationByPrefix('bgsis', 'play', 'bgsis playing', 12, false);
	addAnimationByPrefix('bgsis', 'idle', 'bgsis idle', 12, false);
	addAnimationByPrefix('bgsis', 'gayLeft', 'bgsis gayLeft', 12, false);
	addAnimationByPrefix('bgsis', 'gayRight', 'bgsis gayRight', 12, false);
	addAnimationByPrefix('bgsis', 'danceLeft', 'bgsis danceLeft', 12, false);
	addAnimationByPrefix('bgsis', 'danceRight', 'bgsis danceRight', 12, false);
	scaleObject('bgsis', 0.8, 0.8);
	setScrollFactor('bgsis', 0.9, 0.9);
	objectPlayAnimation('bgsis', 'idle');
	addLuaSprite('bgsis', false);

	
	makeAnimatedLuaSprite('bgshorty', 'characters/bgshorty', -380, 160);
	addAnimationByPrefix('bgshorty', 'idle', 'bgshorty idle', 12, false);
	scaleObject('bgshorty', 0.75, 0.75);
	setScrollFactor('bgshorty', 0.9, 0.9);
	objectPlayAnimation('bgshorty', 'idle');
	addLuaSprite('bgshorty', false);

fill = 0;
double = 0;
gay = 0;
playing = 0;
sisdance = 0;

end

local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'Leaves');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

--Animation functions
function onStepHit()

	if curStep == 112 then
		fill = 1
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 118 then
		fill = 0
	end

	if curStep == 127 then
		playing = 1
	end
	if curStep == 384 then
		fill = 1
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 388 then
		fill = 0
	end

	if curStep == 444 then
		fill = 1
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 449 then
		fill = 0
	end

	if curStep == 508 then
		fill = 1
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 513 then
		fill = 0
	end

	if curStep == 644 then
		playing = 0
	end

	if curStep == 764 then
		fill = 1
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 769 then
		fill = 0
	end

	if curStep == 776 then
		playing = 1

	end

	if curStep == 895 then
		playing = 0
	end

	if curStep == 896 then
		fill = 1
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 899 then
		fill = 0
	end

	if curStep == 924 then
		fill = 1
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 929 then
		fill = 0
	end

	if curStep == 956 then
		fill = 1
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 961 then
		fill = 0
	end

	if curStep == 988 then
		fill = 1
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 993 then
		fill = 0
	end

	if curStep == 1151 then
		fill = 1
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 1156 then
		objectPlayAnimation('bgminji', 'rest')
	end

	if curStep == 1182 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1183 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 1208 then
		objectPlayAnimation('bgminji', 'toms')
	end

	if curStep == 1218 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1281 then
		playing = 1
	end
	if curStep == 1235 then
		objectPlayAnimation('bgminji', 'doubletime')
	end

	if curStep == 1238 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1241 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	
	if curStep == 1244 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	
	if curStep == 1246 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end
	
	if curStep == 1247 then
		objectPlayAnimation('bgminji', 'cymbal', true)
	end

	if curStep == 1273 then
		fill = 0
	end

	if curStep == 1279 then
		playing = 0
	end


	if curStep == 1375 then
		playing = 1
	end
	
	if curStep == 1423 then
		playing = 0
	end

	if curStep == 1520 then
		fill = 1
		objectPlayAnimation('bgminji', 'rest')
	end

	if curStep == 1528 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	if curStep == 1532 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	if curStep == 1535 then
		objectPlayAnimation('bgminji', 'snarecrash', true)
	end

	if curStep == 1544 then
		objectPlayAnimation('bgminji', 'rest')
	end

end


function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 1 == 0 then
		objectPlayAnimation('bgshorty', 'idle');
		objectPlayAnimation('bgtheo', 'idle');
		if fill == 0 and double == 0 then
			objectPlayAnimation('bgminji', 'danceRight');
		end
		if double == 1 and fill == 0 then
			objectPlayAnimation('bgminji', 'doubletime');	
		end
		if gay == 0 then
			if playing == 0 then
				objectPlayAnimation('bgsis', 'idle')
			end
			if playing == 1 then
				if sisdance == 0 then
					objectPlayAnimation('bgsis', 'play')
				end
				if sisdance == 1 then
					objectPlayAnimation('bgsis', 'danceRight')
				end
			end
		end
		if gay == 1 then
			objectPlayAnimation('bgsis', 'gayLeft')
		end
	end
	if curBeat % 2 == 0 then
		if fill == 0 and double == 0 then
			objectPlayAnimation('bgminji', 'danceLeft');
		end
		if gay == 1 then
			objectPlayAnimation('bgsis', 'gayRight')
		end
		if playing == 1 then
			if sisdance == 1 then
				objectPlayAnimation('bgsis', 'danceLeft')
			end
		end
	end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 1 == 0 then
		objectPlayAnimation('bgshorty', 'idle');
		objectPlayAnimation('bgsis', 'idle');
		objectPlayAnimation('bgminji', 'danceRight');
		objectPlayAnimation('bgtheo', 'idle');
	end
	if counter % 2 == 0 then
		objectPlayAnimation('bgminji', 'danceLeft');
	end
end