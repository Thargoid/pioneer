local s = CustomSystem:new('Epsilon Eridani', { 'STAR_K' }) 
	:govtype('CISLIBDEM') 
	:short_desc('Capital of the Confederation. Industrial world with indigenous life.')
	:long_desc([[Epsilon Eridani was the first star system beyond Sol to be colonised by humanity. 
	The New Hope colony on the planet of the same name was founded in 2279. Mass emigration from Earth in the 27th century drove a population explosion which ultimately let to Epsilon Eridani declaring its freedom against the Solar Federation in 2714. 
	After eight years, one failed coup and numerous hard fought battles, freedom was secured at the Battle of Pritchard's Run and the Confederation of Independent Worlds was born. 
	Today, Epsilon Eridani is a thriving centre of industry with relaxed trade laws and has one of the largest population of all inhabited systems.]])




local epserid = CustomSBody:new('Epsilon Eridani', 'STAR_K')
	:radius(f(7,10))
	:mass(f(61,110))
	:temp(4584)


local icarus = CustomSBody:new('Icarus', 'PLANET_TERRESTRIAL')
	:seed(13)
	:radius(f(42,100))
	:mass(f(41,100))
	:temp(687)
	:semi_major_axis(f(17,1000))
	:eccentricity(f(205,1000))
	:inclination(math.deg2rad(7.0))
	:rotation_period(f(12,1))
	:axial_tilt(math.fixed.deg2rad(f(1,100)))
	:metallicity(f(98,100))
	:volcanicity(f(52,100))
	:atmos_density(f(21,100))
	:atmos_oxidizing(f(2,10))
	:ocean_cover(f(0,1))
	:ice_cover(f(0,100))
	:life(f(0,1))



local pritchard = CustomSBody:new('Pritchards Run', 'STARPORT_ORBITAL')
:semi_major_axis(f(90,1000))
:eccentricity(f(1,1000))
:rotation_period(f(6,1))


local atlantica = CustomSBody:new('Atlantica', 'PLANET_TERRESTRIAL')
	:seed(8)
	:radius(f(245,100))
	:mass(f(315,100))
	:temp(328)
	:semi_major_axis(f(793,1000))
	:eccentricity(f(487,1000))
	:inclination(math.deg2rad(3.09))
	:rotation_period(f(243,1))
	:axial_tilt(math.fixed.deg2rad(f(26,10)))
	:metallicity(f(5,6))
	:volcanicity(f(6,10))
	:atmos_density(f(9,1))
	:atmos_oxidizing(f(1,1))
	:ocean_cover(f(8,10))
	:ice_cover(f(0,1))
	:life(f(11,100))
	
local atlantica_starports = {
	CustomSBody:new('Pliands Legacy', 'STARPORT_ORBITAL')
		:semi_major_axis(f(9068,1000000))
		:rotation_period(f(11,24)),
		}

local newhope = CustomSBody:new('New Hope', 'PLANET_TERRESTRIAL')
	:seed(43)
	:radius(f(4,3))
	:mass(f(5,4))
	:temp(287)
	:semi_major_axis(f(9,10))
	:eccentricity(f(367,10000))
	:rotation_period(f(4,6))
	:axial_tilt(math.fixed.deg2rad(f(1741,100)))
	:metallicity(f(5,6))
	:volcanicity(f(68,100))
	:atmos_density(f(15,10))
	:atmos_oxidizing(f(10,10))
	:ocean_cover(f(45,100))
	:ice_cover(f(6,10))
	:life(f(9,10))
	
	local newhope_starports = {
	CustomSBody:new('New Hope', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(31))
		:longitude(math.deg2rad(-121)),
	CustomSBody:new("Gandhi's Revenge", 'STARPORT_SURFACE')
		:latitude(math.deg2rad(19))
		:longitude(math.deg2rad(99)),
	CustomSBody:new('Epsilon Cove', 'STARPORT_SURFACE')
		:latitude(math.deg2rad(51))
		:longitude(1),
	CustomSBody:new('Eridani Commercial Center', 'STARPORT_ORBITAL')
		:semi_major_axis(f(9068,100000000))
		:rotation_period(f(11,24)),
	}
	
	local hades = CustomSBody:new('Hades', 'PLANET_TERRESTRIAL')
		:seed(191082)
		:radius(f(484,1000))
		:mass(f(121,1000))
		:temp(280)
		:semi_major_axis(f(27,100000))
		:eccentricity(f(349,1000))
		:inclination(math.deg2rad(5.145))
		:rotation_period(f(4,10))
		:axial_tilt(math.fixed.deg2rad(f(668,100)))
		:volcanicity(f(9,10))
		:atmos_density(f(1,10))
	
	local Eagles_Nest =	CustomSBody:new('Eagles Nest', 'STARPORT_ORBITAL')
		:semi_major_axis(f(5068,100000000))
		:rotation_period(f(11,24))
	
	
	
local hercules = CustomSBody:new('Hercules', 'PLANET_GAS_GIANT')
	:radius(f(14,1))
	:mass(f(8115,10))
	:temp(134)
	:semi_major_axis(f(4582,1000))
	:eccentricity(f(488,10000))
	:inclination(math.deg2rad(1.305))
	:rotation_period(f(4,10))
	:axial_tilt(math.fixed.deg2rad(f(313,100)))
	
	local hale = CustomSBody:new('Halee', 'PLANET_TERRESTRIAL')
		:seed(14782)
		:radius(f(317,1000))
		:mass(f(117,1000))
		:temp(135)
		:semi_major_axis(f(457,100000))
		:eccentricity(f(92,1000))
		:inclination(math.deg2rad(5.145))
		:rotation_period(f(9,10))
		:axial_tilt(math.fixed.deg2rad(f(668,100)))
		:volcanicity(f(6,10))
		:atmos_density(f(1,15))
		:ocean_cover(f(4,10))
		:ice_cover(f(9,10))
	
	
	s:bodies(epserid, {
	icarus,	
	pritchard,
	atlantica,
		atlantica_starports,
	newhope,
		newhope_starports,
		{
		hades, {
				Eagles_Nest,
				},
		},
	hercules,
			{
			hale,
			},
	})

s:add_to_sector(1,0,-1,v(0.037,0.775,0.784))
