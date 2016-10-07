#!/bin/bash

OSvers=$( sw_vers -productVersion | cut -d. -f2 )
fqdn="ad.company.com"
domain="COMPANYDOMAIN"


if ping -c 2 -o ${fqdn} > /dev/null 2>&1; then
    ## Mac is on the network, continue
    if [[ $(dsconfigad -show | awk '/Active Directory Domain/{ print $NF }') == "${fqdn}" ]]; then
        ADCompName=$(dsconfigad -show | awk '/Computer Account/{ print $NF }') 
        ## Mac has correct dsconfigad info, continue
        if [[ "$OSvers" -ge "7"  ]]; then

            ## NOTE: Change the "DOMAIN" in the command below to your domain name

            security find-generic-password -l "/Active Directory/${COMPANYDOMAIN}" | grep "Active Directory" > /dev/null 2>&1
            if [ "$?" == "0" ]; then
                ## AD keychain file exists, continue
                dscl "/Active Directory/${COMPANYDOMAIN}/All Domains" read /Computers/"$ADCompName" | grep -i "$ADCompName" > /dev/null 2>&1
                if [ "$?" == "0" ]; then
                    ## Successful lookup of computer record. AD communication is working
                    res="Yes"
                else
                    res="No - AD Lookup Failed"
                fi
            else
                res="No - AD Keychain Not Found"
            fi
        else
            if [[ "$OSvers" == "6" ]]; then
                ## OS is 10.6.x, moving on to AD lookup
                dscl "/Active Directory/DOMAIN/All Domains" read /Computers/"$ADCompName" | grep "$ADCompName" > /dev/null 2>&1
                if [ "$?" == "0" ]; then
                    ## Successful lookup of computer record. AD communication is working
                    res="Yes"
                else
                    res="No - AD Lookup Failed"
                fi
            fi
        fi
    else
        res="No - Binding Broken"
    fi
else
    ## Mac is not on the network or has no network connection
    res="Remote"
fi

echo "$res"