function onCreate()

	makeLuaSprite('card', 'card_kunai', 900,450);
	scaleObject('card', 2,2);
	setScrollFactor('card',0,0);

	
	makeAnimatedLuaSprite('bgtheo', 'characters/theo', -250, -70);
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
	addAnimationByPrefix('bgminji', 'doubletime', 'Minji idle_doubletime', 18, false);
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

fill = 1;
double = 0;
gay = 0;
playing = 0;
sisdance = 0;
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
		startDialogue('dialogue', 'Kunoichi');
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
		objectPlayAnimation('bgraquel', 'danceRight');
		if fill == 0 and double == 0 then
			objectPlayAnimation('bgminji', 'danceRight');
		end
		if double == 1 and fill == 0 then
			objectPlayAnimation('bgminji', 'doubletime');	
		end
		
	end
	if curBeat % 2 == 0 then
		objectPlayAnimation('bgraquel', 'danceLeft');
		if fill == 0 and double == 0 then
			objectPlayAnimation('bgminji', 'danceLeft');
		end
		
	end
end

function onStepHit()
	if curStep == 1 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 16 then
		objectPlayAnimation('bgminji', 'rest')
	end
	
	if curStep == 91 then
		objectPlayAnimation('bgminji', 'tom')
	end
	
	if curStep == 111 then
		fill = 0
	end

	if curStep == 124 then
		card = 1
	end

	if curStep == 153 then
		fill = 1
	end

	if curStep == 154 then
		objectPlayAnimation('bgminji', 'snare')
	end

	if curStep == 159 then
		fill = 0
	end

	if curStep == 185 then
		fill = 1
	end

	if curStep == 186 then
		objectPlayAnimation('bgminji', 'snare')
	end

	if curStep == 191 then
		fill = 0
	end

	if curStep == 217 then
		fill = 1
	end

	if curStep == 218 then
		objectPlayAnimation('bgminji', 'snare')
	end

	if curStep == 223 then
		fill = 0
	end

	if curStep == 249 then
		fill = 1
	end

	if curStep == 250 then
		objectPlayAnimation('bgminji', 'snare')
	end

	if curStep == 255 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	
	if curStep == 257 then
		fill = 0
	end

	if curStep == 313 then
		fill = 1
	end


	if curStep == 314 then
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 324 then
		fill = 0
	end

	if curStep == 379 then
		fill = 1
	end

	if curStep == 380 then
		objectPlayAnimation('bgminji', 'snare')
	end

	if curStep == 387 then
		fill = 0
	end

	if curStep == 409 then
		fill = 1
	end

	if curStep == 410 then
		objectPlayAnimation('bgminji', 'snare')
	end

	if curStep == 415 then
		fill = 0
	end

	if curStep == 441 then
		fill = 1
	end

	if curStep == 442 then
		objectPlayAnimation('bgminji', 'snare')
	end

	if curStep == 447 then
		fill = 0
	end

	if curStep == 473 then
		fill = 1
	end

	if curStep == 474 then
		objectPlayAnimation('bgminji', 'snare')
	end

	if curStep == 479 then
		fill = 0
	end

	if curStep == 505 then
		fill = 1
	end

	if curStep == 506 then
		objectPlayAnimation('bgminji', 'snare')
	end

	if curStep == 511 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 515 then
		fill = 0
	end

	if curStep == 571 then
		fill = 1
	end

	if curStep == 572 then
		objectPlayAnimation('bgminji', 'snare')
	end
	if curStep == 575 then
		fill = 0
	end

	if curStep == 619 then
		fill = 1
	end

	if curStep == 620 then
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 628 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 632 then
		objectPlayAnimation('bgminji', 'left')
	end

	if curStep == 636 then
		objectPlayAnimation('bgminji', 'snare')
	end

	if curStep == 639 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 664 then
		objectPlayAnimation('bgminji', 'bass')
	end

	if curStep == 668 then
		objectPlayAnimation('bgminji', 'bass', true)
	end

	if curStep == 672 then
		objectPlayAnimation('bgminji', 'bass', true)
	end

	if curStep == 701 then
		objectPlayAnimation('bgminji', 'snarecrash', true)
	end

	if curStep == 720 then
		objectPlayAnimation('bgminji', 'rest', true)
	end

	if curStep == 764 then
		objectPlayAnimation('bgminji', 'left')
	end
	
	if curStep == 768 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 784 then
		objectPlayAnimation('bgminji', 'bass', true)
	end

	if curStep == 800 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 808 then
		objectPlayAnimation('bgminji', 'left')
	end

	if curStep == 815 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 824 then
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 832 then
		objectPlayAnimation('bgminji', 'shortcymbal')
		fill = 0
	end

	if curStep == 862 then
		fill = 1
	end
	if curStep == 863 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 892 then
		objectPlayAnimation('bgminji', 'snarecrash')
	end

	if curStep == 898 then
		fill = 0
	end

	if curStep == 1150 then
		fill = 1
	end
	if curStep == 1151 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 1153 then
		fill = 0

	end
	if curStep == 1404 then
		fill = 1
	end
	if curStep == 1405 then
		objectPlayAnimation('bgminji', 'snarecrash')
	end

	if curStep == 1415 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 1424 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1431 then
		objectPlayAnimation('bgminji', 'cymbal')
	end


	if curStep == 1439 then
		fill = 0
	end

	if curStep == 1467 then
		fill = 1
	end
	if curStep == 1472 then
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 1424 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1479 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 1488 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1495 then
		objectPlayAnimation('bgminji', 'cymbal')
	end

	if curStep == 1503 then
		fill = 0
	end

	if curStep == 1531 then
		fill = 1
	end
	if curStep == 1536 then
		objectPlayAnimation('bgminji', 'hit', true)
	end
	if curStep == 1538 then
		objectPlayAnimation('bgminji', 'hit', true)
	end

	if curStep == 1542 then
		objectPlayAnimation('bgminji', 'bass', true)
	end

	if curStep == 1544 then
		objectPlayAnimation('bgminji', 'bass', true)
	end

	if curStep == 1548 then
		objectPlayAnimation('bgminji', 'hit', true)
	end

	if curStep == 1550 then
		objectPlayAnimation('bgminji', 'hit', true)
	end

	if curStep == 1552 then
		objectPlayAnimation('bgminji', 'bass', true)
	end

	if curStep == 1555 then
		fill = 0
	end

	if curStep == 1563 then
		fill = 1
	end

	if curStep == 1564 then
		objectPlayAnimation('bgminji', 'tom')
	end

	if curStep == 1567 then
		objectPlayAnimation('bgminji', 'cymbal')
	end
	if curStep == 1571 then
		fill = 0
	end

	if curStep == 1631 then
		fill = 1
	end
	if curStep == 1632 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1634 then
	fill = 0
	end
	if curStep == 1855 then
		fill = 1
	end
	if curStep == 1856 then
		objectPlayAnimation('bgminji', 'shortcymbal')
	end

	if curStep == 1860 then
		objectPlayAnimation('bgminji', 'bass', true)
	end

	if curStep == 1862 then
		objectPlayAnimation('bgminji', 'hit', true)
	end

	if curStep == 1864 then
		objectPlayAnimation('bgminji', 'bass', true)
	end

	if curStep == 1868 then
		objectPlayAnimation('bgminji', 'bass', true)
	end

	if curStep == 1872 then
		objectPlayAnimation('bgminji', 'left', true)
	end

	if curStep == 1874 then
		objectPlayAnimation('bgminji', 'tom', true)
	end

	if curStep == 1878 then
		objectPlayAnimation('bgminji', 'bass', true)
	end

	if curStep == 1880 then
		objectPlayAnimation('bgminji', 'hit', true)
	end

	if curStep == 1882 then
		objectPlayAnimation('bgminji', 'bass', true)
	end

	if curStep == 1884 then
		objectPlayAnimation('bgminji', 'tom', true)
	end

	if curStep == 1896 then
		objectPlayAnimation('bgminji', 'rest', true)
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
		objectPlayAnimation('bgtheo', 'idle');
		objectPlayAnimation('bgraquel', 'danceRight');
	end
	if counter % 2 == 0 then
		objectPlayAnimation('bgraquel', 'danceLeft');
		objectPlayAnimation('bgminji', 'danceLeft');
	end
end

function onUpdate()

	if card == 1 then
		setProperty ('card.x', getProperty ('card.x') + 30);
	end
		
end
