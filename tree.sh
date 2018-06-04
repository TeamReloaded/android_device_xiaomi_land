#!/bin/sh

echo "                                      Script                                                      "
echo "                                        to                                                        "
echo "                                      Set-Up                                                      "
echo "                                      Device                                                      "
echo "	\n Menu: "
echo "\n1. Lineage "
echo "\n2. RR "
echo "\n3. Aex or PixelExperience "
echo "\n4. Reset\n"
while :
do
	read -p "Enter: " value
	case $value in
		lineage|Lineage|1)
			input="lineage"
			echo "\n Setting Up"
			sed -i -e "s/placeholder/$input/g" AndroidProducts.mk
			sed -i -e "s/placeholder/$input/g" placeholder.mk
			sed -i -e "s/placeholder/$input/g" vendorsetup.sh
			mv placeholder.mk $input.mk
			mv placeholder.dependencies $input.dependencies
			break
			;;
		   rr|RR|2)
			input="rr"	
			echo "\n Setting Up"
			sed -i -e "s/placeholder/$input/g" AndroidProducts.mk
			sed -i -e "s/placeholder/$input/g" placeholder.mk
			sed -i -e "s/placeholder/$input/g" vendorsetup.sh
			mv placeholder.mk $input.mk
			mv placeholder.dependencies $input.dependencies
			break
			;;
	     aex|pixel|AEX|Pixel|3)	
			echo "\n Setting Up"
			ap="aosp"
			sed -i -e "s/placeholder/${ap}_land/g" AndroidProducts.mk
			sed -i -e "s/placeholder/$ap/g" placeholder.mk
			sed -i -e "s/placeholder/${ap}_land/g" vendorsetup.sh
			mv placeholder.mk ${ap}_land.mk
			mv placeholder.dependencies $ap.dependencies
			break
			;;
		reset|4)
			echo "\n Resetting :"
			echo "\n1. Lineage "
			echo "\n2. RR "
			echo "\n3. Aex or PixelExperience \n"	
			input1="placeholder"	
			read -p "Enter the configration you were using: " revalue
			case $revalue in
				lineage|Lineage|1)
					tree="lineage"
					if [ ! -f "lineage.mk" ]; then				
						echo "\n Nothing to reset"
					else
						echo "\n Working"
						mv lineage.mk $input1.mk
						mv lineage.dependencies $input1.dependencies
						sed -i -e "s/$tree/$input1/g" AndroidProducts.mk
						sed -i -e "s/$tree/$input1/g" placeholder.mk
						sed -i -e "s/$tree/$input1/g" vendorsetup.sh
					fi
					break
					;;
				     rr|RR|2)
					tree="rr"
					if [ ! -f "rr.mk" ]; then				
						echo "\n Nothing to reset"
					else
						echo "\n Working"
						mv rr.mk $input1.mk
						mv rr.dependencies $input1.dependencies
						sed -i -e "s/$tree/$input1/g" AndroidProducts.mk
						sed -i -e "s/$tree/$input1/g" placeholder.mk
						sed -i -e "s/$tree/$input1/g" vendorsetup.sh
					fi
					break;;
					
                               aex|pixel|AEX|Pixel|3)	
					if [ ! -f "aosp_land.mk" ]; then				
						echo "\n Nothing to reset"
					else
						echo "\n Working"
						mv aosp_land.mk $input1.mk
						mv aosp.dependencies $input1.dependencies
						sed -i -e "s/aosp_land/$input1/g" AndroidProducts.mk
						sed -i -e "s/aosp/$input1/g" placeholder.mk
						sed -i -e "s/aosp_land/$input1/g" vendorsetup.sh
					fi
					break
					;;					
				      *)
					echo "\n Please enter a correct config : "
					;;
			esac
			break
			;;
		exit|5)
			exit
			break
			;;
		*)
			echo "\n Please Enter correct choice"
			;;

			
	esac
done

echo "\n ok"
exit;
 
