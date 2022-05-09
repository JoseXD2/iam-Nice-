function onCreate()

	makeLuaSprite('card', 'card_epiphany', 900,450);
	scaleObject('card', 2,2);
	setScrollFactor('card',0,0);

	
	makeAnimatedLuaSprite('bgminji', 'characters/Minji', 1000, -70);
	addAnimationByPrefix('bgminji', 'danceLeft', 'Minji danceLeft', 12, false);
	addAnimationByPrefix('bgminji', 'danceRight', 'Minji danceRight', 12, false);
	addAnimationByPrefix('bgminji', 'snare', 'Minji fill_snare', 12, true);
	addAnimationByPrefix('bgminji', 'tom', 'Minji fill_tom', 12, false);
	addAnimationByPrefix('bgminji', 'bass', 'Minji singDOWN', 12, false);
	addAnimationByPrefix('bgminji', 'cymbal', 'Minji fill_cymbal', 12, false);
	addAnimationByPrefix('bgminji', 'doubletime', 'Minji idle_doubletime', 18, false);
	addAnimationByPrefix('bgminji', 'rest', 'Minji rest', 12, false);
	addAnimationByPrefix('bgminji', 'shortcymbal', 'Minji fill_shortcymbal', 12, false);
	addAnimationByPrefix('bgminji', 'snarecrash', 'Minji fill_rollcrash', 12, false);
	scaleObject('bgminji', 0.8, 0.8);
	setScrollFactor('bgminji', 0.9, 0.9);
	objectPlayAnimation('bgminji', 'danceRight');
	addLuaSprite('bgminji', false); -- false = add behind characters, true = add over characters
	
	makeAnimatedLuaSprite('bgraquel', 'raquelphone', 1660, 110);
	addAnimationByPrefix('bgraquel', 'idle', 'raquelphone idle', 12, true);
	scaleObject('bgraquel', 0.85, 0.85);
	setScrollFactor('bgraquel', 0.9, 0.9);
	objectPlayAnimation('bgraquel', 'idle');
	addLuaSprite('bgraquel', false);
	
	makeAnimatedLuaSprite('bgshorty', 'shortybook', -500, 190);
	addAnimationByPrefix('bgshorty', 'idle', 'shortybook idle', 12, false);
	scaleObject('bgshorty', 0.75, 0.75);
	setScrollFactor('bgshorty', 0.9, 0.9);
	objectPlayAnimation('bgshorty', 'idle');
	addLuaSprite('bgshorty', false);

	makeAnimatedLuaSprite('bgsis', 'sis_speakers', 350, -160);
	addAnimationByPrefix('bgsis', 'danceLeft', 'sis_speakers danceLeft', 12, false);
	addAnimationByPrefix('bgsis', 'danceRight', 'sis_speakers danceRight', 12, false);
	scaleObject('bgsis', 0.85, 0.85);
	setScrollFactor('bgsis', 1, 1);
	objectPlayAnimation('bgsis', 'danceRight');
	addLuaSprite('bgsis', false);

fill = 1;
double = 0;
card = 0;

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
		startDialogue('dialogue', 'Okay Everyone');
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

		if fill == 0 then
			objectPlayAnimation('bgminji', 'danceRight');
		end

	end
	if curBeat % 2 == 0 then
		if fill == 0 then
			objectPlayAnimation('bgminji', 'danceLeft');
		end
	end

	if (curBeat / 2) % 1 == 0 then
		objectPlayAnimation('bgsis', 'danceRight');
	end
	if (curBeat / 2) % 2 == 0 then
		objectPlayAnimation('bgsis', 'danceLeft');
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
		objectPlayAnimation('bgminji', 'danceRight');
		objectPlayAnimation('bgsis', 'danceRight');
	end
	if counter % 2 == 0 then
		objectPlayAnimation('bgminji', 'danceLeft');
		objectPlayAnimation('bgsis', 'danceLeft');
	end
end

--Midsong events

function onStepHit()
	if curStep == 1 then 
		objectPlayAnimation('bgminji', 'snare');
	end
	if curStep == 16 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end
	if curStep == 76 then
		objectPlayAnimation('bgminji', 'snare');
		card = 1
	end
	if curStep == 128 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end
	if curStep == 136 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
		removeLuaSprite('card,', true)
	end

	if curStep == 142 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 192 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end
	if curStep == 200 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 206 then
		objectPlayAnimation('bgminji', 'snare');
	end

	
	if curStep == 256 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end
	if curStep == 264 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 272 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 320 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end
	if curStep == 328 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 336 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 384 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end
	if curStep == 392 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 400 then
		objectPlayAnimation('bgminji', 'snare');
		fill = 0
	end

	if curStep == 525 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash');
	end

	if curStep == 556 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end

	if curStep == 560 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 584 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 620 then
		objectPlayAnimation('bgminji', 'snarecrash');
	end

	if curStep == 640 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 644 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 647 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 655 then
		fill = 0
	end

	if curStep == 783 then
		fill = 1
	end

	if curStep == 784 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
		fill = 0
	end

	if curStep == 889 then
		fill = 1
	end

	if curStep == 890 then
		objectPlayAnimation('bgminji', 'tom', true);
	end

	if curStep == 899 then
		fill = 0
	end

	if curStep == 1135 then
		fill = 1
	end

	if curStep == 1136 then
		objectPlayAnimation('bgminji', 'snare');
	end


	if curStep == 1146 then
		objectPlayAnimation('bgminji', 'tom', true);
	end
	
	if curStep == 1155 then
		fill = 0
	end

	if curStep == 1647 then
		fill = 1
	end

	if curStep == 1648 then
		objectPlayAnimation('bgminji', 'snare');
	end


	if curStep == 1658 then
		objectPlayAnimation('bgminji', 'tom', true);
	end

	if curStep == 1675 then
		fill = 0
	end


	if curStep == 1679 then
		fill = 1
	end

	if curStep == 1680 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
		fill = 0
	end
	if curStep == 1775 then
		fill = 1
	end
	
	if curStep == 1776 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 1784 then
		objectPlayAnimation('bgminji', 'tom', true);
	end

	if curStep == 1797 then
		fill = 0
	end

	if curStep == 2031 then
		fill = 1
	end
	
	if curStep == 2032 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 2040 then
		objectPlayAnimation('bgminji', 'tom', true);
	end

	if curStep == 2053 then
		fill = 0
	end

	if curStep == 2317 then
		fill = 1
	end

	if curStep == 2318 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2327 then
		fill = 0
	end

	if curStep == 2571 then
		fill = 1
	end
	if curStep == 2572 then
		objectPlayAnimation('bgminji', 'tom', true);
	end

	if curStep == 2575 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2608 then
		objectPlayAnimation('bgminji', 'rest');
	end

	if curStep == 2695 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 2700 then
		objectPlayAnimation('bgminji', 'snarecrash');
	end

	if curStep == 2712 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 2768 then
		objectPlayAnimation('bgminji', 'shortcymbal');
		fill = 0
	end

	if curStep == 2827 then
		fill = 1
	end

	if curStep == 2828 then
		objectPlayAnimation('bgminji', 'snarecrash');
	end

	if curStep == 2840 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 2896 then
		objectPlayAnimation('bgminji', 'shortcymbal');
		fill = 0
	end

	if curStep == 2957 then
		fill = 1
	end

	if curStep == 2958 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	
	if curStep == 2965 then
		fill = 0
	end

	
	if curStep == 3199 then
		fill = 1
	end

	if curStep == 3200 then
		objectPlayAnimation('bgminji', 'snare');
	end
	if curStep == 3212 then
		objectPlayAnimation('bgminji', 'snarecrash');
	end

	if curStep == 3232 then
		objectPlayAnimation('bgminji', 'rest');
	end

	if curStep == 3278 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 3328 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 3336 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 3342 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 3392 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 3400 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 3406 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 3456 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 3464 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 3468 then
		objectPlayAnimation('bgminji', 'snarecrash', true);
	end

	if curStep == 3504 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 3520 then
		objectPlayAnimation('bgminji', 'rest', true);
	end

	if curStep == 3598 then
		objectPlayAnimation('bgminji', 'cymbal', true);
	end

	if curStep == 3610 then
		objectPlayAnimation('bgminji', 'rest', true);
	end

	if curStep == 3725 then
		objectPlayAnimation('bgminji', 'cymbal', true);
	end

	if curStep == 3752 then
		objectPlayAnimation('bgminji', 'rest', true);
	end

end


function onUpdate()

	if card == 1 then
		setProperty ('card.x', getProperty ('card.x') + 30);
	end

end