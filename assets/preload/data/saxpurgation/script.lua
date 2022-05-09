function onCreate()

	makeLuaSprite('card', 'card_expurgation', 900,450);
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
half = 0;
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
		startDialogue('dialogue', 'The Chicken Dance');
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

	if curBeat/2 % 1 == 0 then
		if fill == 0 then
			if half == 0 then
				objectPlayAnimation('bgminji', 'doubletime', true);	
			end
			if half == 1 then
				objectPlayAnimation('bgminji', 'danceRight');
			end
		end
	end

	if curBeat/2 % 2 == 0 then
		if fill == 0 then

			if half == 1 then
				objectPlayAnimation('bgminji', 'danceLeft');
			end
		end
	end
	if curBeat % 1 == 0 then
		objectPlayAnimation('bgshorty', 'idle');
		objectPlayAnimation('bgtheo', 'idle');
		objectPlayAnimation('bgraquel', 'danceRight');
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


end

function onStepHit()

	if curStep == 123 then
		fill = 1

	end


	if curStep == 124 then
		objectPlayAnimation('bgminji','snarecrash')
		card = 1
	end

	if curStep == 63 then
		playing = 1
	end

	if curStep == 135 then
		fill = 0
	end

	if curStep == 255 then
		playing = 0
		fill = 1
	end

	if curStep == 256 then
		objectPlayAnimation('bgminji','shortcymbal')
		fill = 0
	end


	if curStep == 367 then
		playing = 1
	end

	if curStep == 375 then
		fill = 1
	end

	if curStep == 376 then
		objectPlayAnimation('bgminji','tom')
	end

	if curStep == 382 then
		objectPlayAnimation('bgminji','cymbal')
	end

	if curStep == 389 then
		fill = 0
	end

	if curStep == 510 then
		fill = 1
	end

	if curStep == 511 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 519 then
		fill = 0
	end

	if curStep == 527 then
		fill = 1
	end
	if curStep == 528 then
		objectPlayAnimation('bgminji','shortcymbal')
		fill = 0
	end

	if curStep == 574 then
		fill = 1
	end

	if curStep == 575 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 581 then
		fill = 0
	end

	if curStep == 591 then
		fill = 1
	end
	if curStep == 592 then
		objectPlayAnimation('bgminji','shortcymbal')
		fill = 0
	end

	if curStep == 638 then
		fill = 1
	end

	if curStep == 639 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 640 then
		fill = 0
	end

	if curStep == 655 then
		fill = 1
	end
	if curStep == 656 then
		objectPlayAnimation('bgminji','shortcymbal')
		fill = 0
	end

	if curStep == 702 then
		fill = 1
	end

	if curStep == 703 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 707 then
		fill = 0
	end

	if curStep == 719 then
		fill = 1
	end
	if curStep == 720 then
		objectPlayAnimation('bgminji','shortcymbal')
		fill = 0
	end

	if curStep == 763 then
		fill = 1
	end

	if curStep == 764 then
		objectPlayAnimation('bgminji','snarecrash')
	end

	if curStep == 772 then
		objectPlayAnimation('bgminji','bass')
	end

	if curStep == 776 then
		objectPlayAnimation('bgminji','hit')
	end


	if curStep == 778 then
		objectPlayAnimation('bgminji','bass')
	end

	if curStep == 780 then
		objectPlayAnimation('bgminji','hit')
	end

	if curStep == 782 then
		objectPlayAnimation('bgminji','bass')
	end

	if curStep == 784 then
		objectPlayAnimation('bgminji','shortcymbal')
	end

	if curStep == 788 then
		objectPlayAnimation('bgminji','bass', true)
	end
	if curStep == 792 then
		objectPlayAnimation('bgminji','bass', true)
	end
	if curStep == 796 then
		objectPlayAnimation('bgminji','bass', true)
	end


	if curStep == 799 then
		objectPlayAnimation('bgminji', 'cymbal');
		playing = 0
	end
	if curStep == 801 then
		fill = 0
	end

	if curStep == 911 then
		fill = 1
	end

	if curStep == 912 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 924 then
		objectPlayAnimation('bgminji', 'snarecrash');
	end
	if curStep == 931 then
		fill = 0
	end

	if curStep == 991 then
		fill = 1
	end

	if curStep == 992 then
		objectPlayAnimation('bgminji','shortcymbal')

	end

	if curStep == 998 then
		objectPlayAnimation('bgminji','left')

	end

	if curStep == 1004 then
		objectPlayAnimation('bgminji','hit')

	end

	if curStep == 1008 then
		objectPlayAnimation('bgminji','left')

	end

	if curStep == 1014 then
		objectPlayAnimation('bgminji','shortcymbal')

	end

	if curStep == 1019 then
		fill = 0
	end
	if curStep == 1054 then
		fill = 1
	end

	if curStep == 1055 then
		objectPlayAnimation('bgminji','cymbal')

	end
	if curStep == 1059 then
		fill = 0
	end
	if curStep == 1071 then
		playing = 1
	end

	if curStep == 1118 then
		fill = 1
	end

	if curStep == 1119 then
		objectPlayAnimation('bgminji','cymbal')

	end

	if curStep == 1123 then
		fill = 0
	end

	if curStep == 1819 then
		fill = 1
	end
	if curStep == 1820 then
		objectPlayAnimation('bgminji', 'snarecrash');
		half = 1
		playing = 0
	end

	if curStep == 1827 then
		fill = 0
	end

	if curStep == 1943 then
		fill = 1
	end
	if curStep == 1944 then
		objectPlayAnimation('bgminji', 'snare');
	end
	if curStep == 1951 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 1959 then
		fill = 0
	end
	if curStep == 1967 then
		playing = 1
	end

	if curStep == 2063 then
		half = 0
	end

	if curStep == 2075 then
		fill = 1
	end

	if curStep == 2076 then
		objectPlayAnimation('bgminji', 'snarecrash');
	end

	if curStep == 2083 then
		fill = 0
	end

	if curStep == 2207 then
		fill = 1
	end

	if curStep == 2208 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2212 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end

	if curStep == 2216 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2219 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2224 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2228 then
		objectPlayAnimation('bgminji', 'left');
	end

	if curStep == 2232 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2235 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2240 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2244 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end

	if curStep == 2248 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2251 then
		objectPlayAnimation('bgminji', 'cymbal');
	end
	if curStep == 2256 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2260 then
		objectPlayAnimation('bgminji', 'left');
	end

	if curStep == 2264 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2267 then
		objectPlayAnimation('bgminji', 'cymbal');

	end
	if curStep == 2272 then
		objectPlayAnimation('bgminji', 'hit');
	end

	if curStep == 2276 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end

	if curStep == 2280 then
		objectPlayAnimation('bgminji', 'hit');
	end

	if curStep == 2284 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end

	if curStep == 2288 then
		objectPlayAnimation('bgminji', 'hit');
	end

	if curStep == 2292 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end

	if curStep == 2296 then
		objectPlayAnimation('bgminji', 'hit');
	end

	if curStep == 2300 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end

	if curStep == 2304 then
		objectPlayAnimation('bgminji', 'hit');
	end

	if curStep == 2308 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end
	if curStep == 2312 then
		objectPlayAnimation('bgminji', 'snare');
	end
	if curStep == 2319 then
		objectPlayAnimation('bgminji', 'cymbal');
		playing = 0
	end

	if curStep == 2328 then
		objectPlayAnimation('bgminji', 'bass', true);
	end
	if curStep == 2332 then
		objectPlayAnimation('bgminji', 'bass', true);
	end

	if curStep == 2336 then
		objectPlayAnimation('bgminji', 'shortcymbal', true);
	end

	if curStep == 2339 then
		fill = 0
	end


	if curStep == 2591 then
		playing = 1
	end

	if curStep == 2719 then
		fill = 1
	end


	if curStep == 2720 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2723 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2728 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2731 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2736 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2739 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2744 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2747 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2752 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2755 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2760 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2763 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2768 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2771 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2776 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2779 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2784 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2787 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2792 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2795 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2800 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2803 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2808 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2811 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2816 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2819 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2824 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2827 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2832 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2835 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2840 then
		objectPlayAnimation('bgminji', 'bass');
	end

	if curStep == 2843 then
		objectPlayAnimation('bgminji', 'cymbal');
	end
	if curStep == 2848 then
		objectPlayAnimation('bgminji', 'shortcymbal');
		playing = 0
		fill = 0
	end

	if curStep == 2958 then
		playing = 1
	end

	if curStep == 2967 then
		fill = 1
	end
	if curStep == 2968 then
		objectPlayAnimation('bgminji', 'shortcymbal');
	end
	if curStep == 2972 then
		objectPlayAnimation('bgminji', 'tom');
	end

	if curStep == 2975 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 2980 then
		fill = 0
	end

	if curStep == 3099 then
		fill = 1
	end
	if curStep == 3100 then
		objectPlayAnimation('bgminji', 'snare');
	end

	if curStep == 3103 then
		objectPlayAnimation('bgminji', 'cymbal');
	end

	if curStep == 3132 then
		objectPlayAnimation('bgminji', 'tom');
	end

	if curStep == 3152 then
		objectPlayAnimation('bgminji', 'rest');
	end

end

function onUpdate()

	if card == 1 then
		setProperty ('card.x', getProperty ('card.x') + 30);
	end
		
end
