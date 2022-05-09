function onCreate()

	
	makeAnimatedLuaSprite('bgminji', 'characters/Minji', 1000, -70);
	addAnimationByPrefix('bgminji', 'danceLeft', 'Minji danceLeft', 12, false);
	addAnimationByPrefix('bgminji', 'danceRight', 'Minji danceRight', 12, false);
	addAnimationByPrefix('bgminji', 'snare', 'Minji fill_snare', 12, true);
	addAnimationByPrefix('bgminji', 'tom', 'Minji fill_tom', 12, false);
	addAnimationByPrefix('bgminji', 'cymbal', 'Minji fill_cymbal', 12, false);
	addAnimationByPrefix('bgminji', 'doubletime', 'Minji idle_doubletime', 18, false);
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
	
	makeAnimatedLuaSprite('bgraquel', 'characters/Raquel', 310, -110);
	addAnimationByPrefix('bgraquel', 'danceLeft', 'Raquel danceLeft', 12, false);
	addAnimationByPrefix('bgraquel', 'danceRight', 'Raquel danceRight', 12, false);
	scaleObject('bgraquel', 0.85, 0.85);
	setScrollFactor('bgraquel', 0.9, 0.9);
	objectPlayAnimation('bgraquel', 'danceRight');
	addLuaSprite('bgraquel', false);
	
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

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 1 == 0 then
		objectPlayAnimation('bgshorty', 'idle');

		objectPlayAnimation('bgraquel', 'danceRight');
		if fill == 0 then
			objectPlayAnimation('bgminji', 'danceRight');
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
		objectPlayAnimation('bgraquel', 'danceLeft');
		if fill == 0 then
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

function onStepHit()
	if curStep == 28 then
		fill = 1
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 31 then
		fill = 0
		playing = 0
	end

	if curStep == 156 then
		fill = 1
		playing = 1
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 159 then
		fill = 0
	end

	if curStep == 348 then
		fill = 1
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 351 then
		fill = 0
	end

	if curStep == 400 then
		fill = 1
		objectPlayAnimation('bgminji', 'shortcymbal');
	end

	if curStep == 412 then
		objectPlayAnimation('bgminji', 'snare');
	end
	if curStep == 415 then
		objectPlayAnimation('bgminji', 'cymbal');
		sisdance = 1
	end

	if curStep == 417 then
		fill = 0
	end


	if curStep == 544 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end

	if curStep == 547 then
		fill = 0
	end

	if curStep == 624 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end

	if curStep == 632 then
		objectPlayAnimation('bgminji', 'shortcymbal',true);
	end
	if curStep == 636 then
		objectPlayAnimation('bgminji', 'shortcymbal',true);
	end
	if curStep == 639 then
		fill = 0
	end
	if curStep == 671 then
		sisdance = 0
	end
	if curStep == 712 then
		fill = 1
		objectPlayAnimation('bgminji', 'snare',true);
	end
	if curStep == 718 then
		objectPlayAnimation('bgminji', 'snarecrash',true);
	end

	if curStep == 719 then
		playing = 0
	end

	if curStep == 731 then
		objectPlayAnimation('bgminji', 'snare',true);
	end

	if curStep == 736 then
		objectPlayAnimation('bgminji', 'shortcymbal',true);
	end
	if curStep == 739 then
		fill = 0
	end

	if curStep == 859 then
		fill = 1
		objectPlayAnimation('bgminji', 'snare',true);
	end

	if curStep == 863 then
		fill = 0
	end

	if curStep == 987 then
		fill = 1
		objectPlayAnimation('bgminji', 'snare',true);
	end

	if curStep == 990 then
		fill = 0
		playing = 1
	end

	if curStep == 1033 then
		fill = 1
		objectPlayAnimation('bgminji', 'snare',true);
	end
	if curStep == 1039 then
		playing = 0
	end
	if curStep == 1040 then
		objectPlayAnimation('bgminji', 'shortcrash')
	end
	if curStep == 1043 then
		objectPlayAnimation('bgminji', 'rest')
	end
	if curStep == 1169 then
		playing = 1
	end
	if curStep == 1180 then
		objectPlayAnimation('bgminji', 'snare',true);
	end

	if curStep == 1182 then
		objectPlayAnimation('bgminji', 'snarecrash')
		sisdance = 1
	end
	if curStep == 1186 then
		fill = 0
	end
	if curStep == 1263 then
		fill = 1
		sisdance = 0
		playing = 0
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 1272 then
		objectPlayAnimation('bgminji', 'rest')
	end

	if curStep == 1310 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 1317 then
		objectPlayAnimation('bgminji', 'rest')
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
		if playing == 0 then
		objectPlayAnimation('bgsis', 'idle');
		end
		objectPlayAnimation('bgminji', 'danceRight');
		objectPlayAnimation('bgraquel', 'danceRight');
	end
	if counter % 2 == 0 then
		objectPlayAnimation('bgraquel', 'danceLeft');
		objectPlayAnimation('bgminji', 'danceLeft');
	end
	if counter == 3 then
		playing = 1
		objectPlayAnimation('bgsis', 'play');
	end
end