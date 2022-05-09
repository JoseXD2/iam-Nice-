function onCreate()

	makeAnimatedLuaSprite('bgtheo', 'characters/bgtheo', 250, -50);
addAnimationByPrefix('bgtheo', 'danceLeft', 'bgtheo danceLeft', 12, false);
addAnimationByPrefix('bgtheo', 'danceRight', 'bgtheo danceRight', 12, false);
scaleObject('bgtheo', 0.85, 0.85);
setScrollFactor('bgtheo', 1, 1);
objectPlayAnimation('bgtheo', 'danceRight');
addLuaSprite('bgtheo', false);

makeAnimatedLuaSprite('bgminji', 'characters/Minji', 950, 50);
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

makeAnimatedLuaSprite('bgraquel', 'characters/Raquel', -170, -70);
addAnimationByPrefix('bgraquel', 'danceLeft', 'Raquel danceLeft', 12, false);
addAnimationByPrefix('bgraquel', 'danceRight', 'Raquel danceRight', 12, false);
scaleObject('bgraquel', 0.9, 0.9);
setScrollFactor('bgraquel', 0.9, 0.9);
objectPlayAnimation('bgraquel', 'danceRight');
addLuaSprite('bgraquel', false);

makeAnimatedLuaSprite('bgshorty', 'characters/bgshorty', -370, 250);
addAnimationByPrefix('bgshorty', 'idle', 'bgshorty idle', 12, false);
scaleObject('bgshorty', 0.8, 0.8);
setScrollFactor('bgshorty', 0.9, 0.9);
objectPlayAnimation('bgshorty', 'idle');
addLuaSprite('bgshorty', false);

	fill = 0;
	double = 0;

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
		startDialogue('dialogue', 'Basic 12 Bar Blues');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 1 == 0 then
		objectPlayAnimation('bgshorty', 'idle');
		objectPlayAnimation('bgtheo', 'danceRight');
		objectPlayAnimation('bgraquel', 'danceRight');
		if fill == 0 and double == 0 then
		objectPlayAnimation('bgminji', 'danceRight');
		end
		if double == 1 and fill == 0 then
		objectPlayAnimation('bgminji', 'doubletime');
		end
	end
	if curBeat % 2 == 0 then
		objectPlayAnimation('bgtheo', 'danceLeft');
		objectPlayAnimation('bgraquel', 'danceLeft');
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
	if counter % 1 == 0 then
		objectPlayAnimation('bgminji', 'danceRight');
		objectPlayAnimation('bgshorty', 'idle');
		objectPlayAnimation('bgtheo', 'danceRight');
		objectPlayAnimation('bgraquel', 'danceRight');
	end
	if counter % 2 == 0 then
		objectPlayAnimation('bgminji', 'danceLeft');
		objectPlayAnimation('bgtheo', 'danceLeft');
		objectPlayAnimation('bgraquel', 'danceLeft');
	end
end

function onStepHit()

	if curStep == 24 then
		objectPlayAnimation('bgminji', 'tom')
	end
	
	
	if curStep == 286 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	
	if curStep == 350 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end
	
	if curStep == 477 then
		fill = 1
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 483 then
		fill = 0
	end

	if curStep == 601 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 605 then
		fill = 1
		objectPlayAnimation('bgminji', 'cymbal')
	end

	
	if curStep == 611 then
		fill = 0
	end
	
	if curStep == 720 then
		objectPlayAnimation('bgminji', 'cymbal')
	end


	if curStep == 1304 then
		objectPlayAnimation('bgminji', 'tom')
	end

	
	if curStep == 1308 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash')
	end

	
	if curStep == 1315 then
		fill = 0
	end

	
	if curStep == 1440 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end


	if curStep == 1631 then
		fill = 1
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 1636 then
		fill = 0
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1644 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1652 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1660 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1668 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1676 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1684 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end


	if curStep == 1692 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1700 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1708 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1716 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1724 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1732 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1740 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1748 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1756 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1764 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1772 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1780 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1787 then
		fill = 1
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 1819 then
		objectPlayAnimation('bgminji', 'snarecrash')
	end

	if curStep == 1832 then
		objectPlayAnimation('bgminji', 'rest')
	end
end