function onCreate()

	makeLuaSprite('card', 'card_endless', 900,450);
	scaleObject('card', 2,2);
	setScrollFactor('card',0,0);

	
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
	addAnimationByPrefix('bgminji', 'bass', 'Minji singDOWN', 12, false);
	addAnimationByPrefix('bgminji', 'left', 'Minji singLEFT', 12, false);
	addAnimationByPrefix('bgminji', 'hit', 'Minji singRIGHT', 12, false);
	scaleObject('bgminji', 0.8, 0.8);
	setScrollFactor('bgminji', 0.9, 0.9);
	objectPlayAnimation('bgminji', 'danceRight');
	addLuaSprite('bgminji', false); -- false = add behind characters, true = add over characters

	makeAnimatedLuaSprite('bgsis', 'sisbgharmon', 750, -50);
	addAnimationByPrefix('bgsis', 'play', 'sisbgharmon playing', 12, false);
	addAnimationByPrefix('bgsis', 'idle', 'sisbgharmon idle', 12, false);
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
playing = 0;


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
		startDialogue('dialogue', 'Slow Jazz');
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
		objectPlayAnimation('bgtheo', 'idle');
		if fill == 0 and double == 0 then
			objectPlayAnimation('bgminji', 'danceRight');
		end
		if double == 1 and fill == 0 then
			objectPlayAnimation('bgminji', 'doubletime');	
		end
		if playing == 0 then
			objectPlayAnimation('bgsis', 'idle')
		end
		if playing == 1 then
			objectPlayAnimation('bgsis', 'play')
		end


	end
	if curBeat % 2 == 0 then
		if fill == 0 and double == 0 then
			objectPlayAnimation('bgminji', 'danceLeft');
		end
	end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter == 0 then
		addLuaSprite('card', true);
	end
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

function onStepHit()

	if curStep == 124 then
		card = 1
	end

	if curStep == 439 then
		playing = 1
	end

	if curStep == 463 then
		playing = 0
	end

	if curStep == 583 then
		playing = 1
	end

	if curStep == 591 then
		playing = 0
	end

	if curStep == 697 then
		fill = 1
	end

	if curStep == 698 then
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 703 then
		fill = 0
		double = 1
	end

	if curStep == 831 then
		playing = 1
		fill = 1
	end
	if curStep == 832 then
		objectPlayAnimation('bgminji', 'shortcymbal')
		fill = 0
	end

	if curStep == 1071 then
		double = 0
		playing = 0
	end

	if curStep == 1082 then
		fill = 1
	end
	if curStep == 1083 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 1088 then
		objectPlayAnimation('bgminji', 'shortcymbal')
		fill = 0
	end

	if curStep == 1223 then
		playing = 1
	end
	
	if curStep == 1335 then
		fill = 1
	end

	if curStep == 1336 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	
	if curStep == 1340 then
		objectPlayAnimation('bgminji', 'hit', true)
	end

	if curStep == 1342 then
		objectPlayAnimation('bgminji', 'hit', true)
	end

	if curStep == 1344 then
		objectPlayAnimation('bgminji', 'shortcymbal')
		fill = 0
	end

	if curStep == 1470 then
		fill = 1
	end

	if curStep == 1471 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 1475 then
		fill = 0
	end

	if curStep == 1598 then
		fill = 1
	end

	if curStep == 1599 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 1603 then
		fill = 0
	end

	if curStep == 1727 then
		fill = 1
	end
	if curStep == 1728 then
		objectPlayAnimation('bgminji', 'shortcymbal')
		fill = 0
	end

	if curStep == 1727 then
		fill = 1
	end
	if curStep == 1728 then
		objectPlayAnimation('bgminji', 'shortcymbal')
		fill = 0
	end
	if curStep == 1983 then
		fill = 1
	end
	if curStep == 1984 then
		objectPlayAnimation('bgminji', 'shortcymbal')
		fill = 0
	end

	if curStep == 2143 then
		fill = 1
	end
	if curStep == 2144 then
		objectPlayAnimation('bgminji', 'left')
	end

	if curStep == 2158 then
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 2168 then
		objectPlayAnimation('bgminji', 'rest')
	end

end

function onUpdate()

	if card == 1 then
		setProperty ('card.x', getProperty ('card.x') + 30);
	end
		
end
