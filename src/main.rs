use std::process::Command;
use std::io;

fn main() {

    println!("Fedora Network Fixer\nthis program will set fedora networking back to legacy (workstation23)\n");
    println!("THIS PROGRAM DOES NOT COME WITH ANY WARRENTY OR WAY TO RESET FEDORA NETWORKING");
    println!("license: LGPLv3");
    println!("do you wish to continue? Y/N");

    let mut agree = String::new();


    io::stdin().read_line(&mut agree).ok().expect("error: could not parse input");

    let agree = agree.trim();




    if agree == "Y" {

//        update-crypto-policies --set LEGACY


    let mut cryptpol = Command::new("update-crypto-policies");

    cryptpol.arg("--set");
    cryptpol.arg("LEGACY");

    // dnf install crypto-policies-scripts

    let mut install = Command::new("dnf");

    install.arg("install");
    install.arg("crypto-policies-scripts");
    install.arg("-Y");

    // update-crypto-policies --set DEFAULT:FEDORA32
    
    let mut cryup = Command::new("update-crypto-policies");

    cryup.arg("--set");
    cryup.arg("DEFAULT:FEDORA32");



    let mut out1 = cryptpol.output().unwrap().stdout;
    let mut out2 = install.output().unwrap().stdout;
    let mut out3 = cryup.output().unwrap().stdout;


    let la = String::from_utf8_lossy(&out1);
    let ba = String::from_utf8_lossy(&out2);
    let sa = String::from_utf8_lossy(&out3);

    let finout = la + ba + sa;

    println!("{}", finout)


    


    }

    else { 
        println!("exiting,,,");
    };
}
