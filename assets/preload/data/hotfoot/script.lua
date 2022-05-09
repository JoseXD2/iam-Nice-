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
		if fill == 0 then
		objectPlayAnimation('bgminji', 'doubletime');
		end
	end
	if curBeat % 2 == 0 then
		objectPlayAnimation('bgtheo', 'danceLeft');
		objectPlayAnimation('bgraquel', 'danceLeft');
		if fill == 0 then
		objectPlayAnimation('bgminji', 'doubletime');
		end
	end
end

function onStepHit()


	if curStep == 56 then
		objectPlayAnimation('bgminji', 'tom')
	end
	if curStep == 128 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end
	if curStep == 176 then
		objectPlayAnimation('bgminji', 'snare')
	end
	if curStep == 176 then
		fill = 1
		objectPlayAnimation('bgminji', 'snare')
	end
	if curStep == 184 then
		objectPlayAnimation('bgminji', 'snare')
	end
	if curStep == 190 then
		fill = 0

	end
	if curStep == 2140 then
		objectPlayAnimation('bgminji', 'snare')
		fill = 1
	end
	if curStep == 2146 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2156 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end
	if curStep == 2162 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2172 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 2178 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2188 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 2194 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2204 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 2210 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2220 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 2226 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2236 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 2242 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2252 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 2258 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2268 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 2274 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2284 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 2290 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2300 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 2306 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2316 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 2322 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2332 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 2338 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 2348 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 2350 then
		objectPlayAnimation('bgminji', 'cymbal')
		fill = 0
	end

	if curStep == 2510 then
		objectPlayAnimation('bgminji', 'cymbal')
		fill = 1
	end

	if curStep == 2540 then
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 2560 then
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
		objectPlayAnimation('bgminji', 'doubletime');
		objectPlayAnimation('bgtheo', 'danceRight');
		objectPlayAnimation('bgraquel', 'danceRight');
	end
	if counter % 2 == 0 then
		objectPlayAnimation('bgtheo', 'danceLeft');
		objectPlayAnimation('bgraquel', 'danceLeft');
	end
end
local allowEnd = false
function onEndSong()
	if not allowEnd and isStoryMode then
		setProperty('inCutscene', true);
		startDialogue('dialogue2', 'Basic 12 Bar Blues');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end