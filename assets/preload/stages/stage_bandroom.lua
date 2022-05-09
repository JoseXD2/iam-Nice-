function onCreate()
	-- background shit
	makeLuaSprite('bandroom_wall', 'bandroom_wall', -350, -300);
	setScrollFactor('bandroom_wall', 0.9, 0.9);
	scaleObject('bandroom_wall', 0.8, 0.8);
	
	makeLuaSprite('bandroom_musicstands', 'bandroom_musicstands', -350, -300);
	setScrollFactor('bandroom_musicstands', 0.9, 0.9);
	scaleObject('bandroom_musicstands', 0.8, 0.8);

	makeLuaSprite('fg_musicstands', 'bandroom_musicstands_fg', -350, -600);
	setScrollFactor('fg_musicstands', 0.8, 0.8);
	scaleObject('fg_musicstands', 0.9, 0.9);



	addLuaSprite('bandroom_wall', false);
	addLuaSprite('bandroom_musicstands', false);
	addLuaSprite('fg_musicstands', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end