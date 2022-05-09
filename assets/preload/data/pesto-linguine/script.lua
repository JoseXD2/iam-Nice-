function onCreate()


	
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
		objectPlayAnimation('bgtheo', 'idle');
		objectPlayAnimation('bgraquel', 'danceRight');
		if fill == 0 then
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
		objectPlayAnimation('bgraquel', 'danceLeft');
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


	if curStep == 12 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)

	end

	if curStep == 20 then
		objectPlayAnimation('bgminji', 'snare', true)

	end

--

	if curStep == 28 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)

	end

	if curStep == 39 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 48 then
		objectPlayAnimation('bgminji', 'snare', true)

	end

--

	if curStep == 56 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)

	end

	if curStep == 67 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 76 then
		objectPlayAnimation('bgminji', 'snare', true)

	end

--

	if curStep == 84 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)

	end

	if curStep == 95 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 104 then
		objectPlayAnimation('bgminji', 'snare', true)

	end

	if curStep == 107 then
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 118 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	if curStep == 123 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 135 then
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 146 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	if curStep == 151 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 163 then
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 174 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	if curStep == 179 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 191 then
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 198 then
		fill = 0
	end


	if curStep == 330 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 342 then
		objectPlayAnimation('bgminji', 'snare', true)
	end

	if curStep == 363 then
		fill = 0
	end
	--
	if curStep == 386 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 398 then
		objectPlayAnimation('bgminji', 'snare', true)
	end

	if curStep == 417 then
		fill = 0
	end
	--

	if curStep == 554 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 566 then
		objectPlayAnimation('bgminji', 'snare', true)
	end

	if curStep == 587 then
		fill = 0
	end
	--
	if curStep == 610 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 622 then
		objectPlayAnimation('bgminji', 'snare', true)
	end

	if curStep == 641 then
		fill = 0
	end

	--

	if curStep == 783 then
		playing = 1
	end
	if curStep == 895 then
		playing = 0
	end
	if curStep == 1002 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 1014 then
		objectPlayAnimation('bgminji', 'snare', true)
	end

	if curStep == 1035 then
		fill = 0
	end

	if curStep == 1058 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 1070 then
		objectPlayAnimation('bgminji', 'snare', true)
	end

	if curStep == 1089 then
		fill = 0
	end

	--
	if curStep == 1172 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)
	end

	if curStep == 1180 then
		fill = 0
	end
	if curStep == 1183 then
		playing = 1
	end

	if curStep == 1519 then
		playing = 0
	end

	--

	if curStep == 1619 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 1630 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	if curStep == 1635 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 1647 then
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 1658 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	if curStep == 1663 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end
--
	if curStep == 1675 then
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 1686 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	if curStep == 1691 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 1706 then
		fill = 0
	end

--

	if curStep == 1842 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 1854 then
		objectPlayAnimation('bgminji', 'snare', true)
	end

	if curStep == 1875 then
		fill = 0
	end

	--

	if curStep == 1898 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 1910 then
		objectPlayAnimation('bgminji', 'snare', true)
	end

	if curStep == 1923 then
		fill = 0
	end
	

	if curStep == 2066 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 2078 then
		objectPlayAnimation('bgminji', 'snare', true)
	end

	if curStep == 2099 then
		fill = 0
	end

	--

	if curStep == 2122 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 2134 then
		objectPlayAnimation('bgminji', 'snare', true)
	end

	if curStep == 2147 then
		fill = 0
	end

	if curStep == 2295 then
		playing = 1
	end

--
	if curStep == 2407 then
		playing = 0
	end
	if curStep == 2514 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 2526 then
		objectPlayAnimation('bgminji', 'snare', true)
	end

	if curStep == 2547 then
		fill = 0
	end

	if curStep == 2570 then
		fill = 1
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 2582 then
		objectPlayAnimation('bgminji', 'snare', true)
	end

	if curStep == 2603 then
		fill = 0
	end


	--Ending sequence
	if curStep == 2631 then
		fill = 1
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 2644 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)

	end

	if curStep == 2652 then
		objectPlayAnimation('bgminji', 'snare', true)

	end

--

	if curStep == 2660 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)

	end

	if curStep == 2671 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 2682 then
		objectPlayAnimation('bgminji', 'snare', true)

	end

--

	if curStep == 2688 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)

	end

	if curStep == 2699 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 2710 then
		objectPlayAnimation('bgminji', 'snare', true)

	end

--

	if curStep == 2716 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)

	end

	if curStep == 2727 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 2738 then
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 2750 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	if curStep == 2755 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 2766 then
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 2778 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	if curStep == 2783 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 2794 then
		objectPlayAnimation('bgminji', 'snarecrash', true)

	end

	if curStep == 2806 then
		objectPlayAnimation('bgminji', 'shortcymbal', true)
	end

	if curStep == 2811 then
		objectPlayAnimation('bgminji', 'cymbal', true)

	end

	if curStep == 2822 then
		objectPlayAnimation('bgminji', 'tom', true)

	end

	if curStep == 2856 then
		objectPlayAnimation('bgminji', 'rest', true)

	end

end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 1 == 0 then
		objectPlayAnimation('bgsis', 'idle');

		objectPlayAnimation('bgtheo', 'idle');
		objectPlayAnimation('bgraquel', 'danceRight');
		if fill == 0 then
			objectPlayAnimation('bgminji', 'doubletime');
		end
	end
	if counter % 2 == 0 then
		objectPlayAnimation('bgraquel', 'danceLeft');
	end

	if counter == 3 then
		objectPlayAnimation('bgminji', 'cymbal');
		fill = 1
	end
end