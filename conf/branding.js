"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.branding = void 0;
const tslib_1 = require("tslib");
/**
 * penguins-eggs: buster/branding.ts
 *
 * author: Piero Proietti
 * mail: piero.proietti@gmail.com
 */
const js_yaml_1 = tslib_1.__importDefault(require("js-yaml"));
/**
 *
 * @param remix
 * @param oses
 * @param verbose
 */
function branding(remix, distro, brand = '', verbose = false) {
    const homeUrl = 'https://ibuntuos.com';
    const supportUrl = 'https://ibuntuos.com';
    const bugReportUrl = 'https://ibuntuos.com';
    const productName = 'iBuntu Lix Sur';
    const shortProductName = 'iBuntu OS';
    //const today = new Date();
    //const day = ('0' + today.getDate()).slice(-2);
    //const month = ('0' + (today.getMonth() + 1)).slice(-2);
    //const year = today.getFullYear();
    //const version = year + '-' + month + '-' + day;
    const version ='2.1';
    const shortVersion = 'Lix Sur';
    const versionedName = productName + ' ' + version; // Questa la mette nella descrizione andrebbe aggiunta la versione dal nome della iso
    const shortVersionedName = 'iBuntu Lix Sur';
    let bootloaderEntryName = versionedName;
    // Necessario: Devuan, LMDE, caraco, syslinuxos devono avere EFI=Debian altrimenti non funziona EFI
    switch (distro.distroId.toLowerCase()) {
        case 'caraco':
        case 'devuan':
        case 'lmde':
        case 'syslinuxos': {
            bootloaderEntryName = 'Debian';
            break;
        }
        default: {
            bootloaderEntryName = distro.distroId;
        }
    }
    const productUrl = homeUrl;
    const releaseNotesUrl = 'https://ibuntuos.com';
    const productLogo = `${remix.branding}-logo.png`;
    const productIcon = `${remix.branding}-logo.png`;
    const productWelcome = 'welcome.png';
    const slideshow = 'show.qml';
    const branding = {
        componentName: remix.branding,
        welcomeStyleCalamares: true,
        strings: {
            productName: productName,
            shortProductName: shortProductName,
            version: version,
            shortVersion: shortVersion,
            versionedName: versionedName,
            shortVersionedName: shortVersionedName,
            bootloaderEntryName: bootloaderEntryName,
            productUrl: productUrl,
            supportUrl: supportUrl,
            bugReportUrl: bugReportUrl,
            releaseNotesUrl: releaseNotesUrl
        },
        images: {
            productLogo: productLogo,
            productIcon: productIcon,
            productWelcome: productWelcome
        },
        slideshowAPI: 1,
        slideshow: slideshow,
        style: {
            sidebarBackground: '#808080',
            sidebarText: '#FFFFFF',
            sidebarTextSelect: '#788694'
        }
    };
    return js_yaml_1.default.dump(branding);
}
exports.branding = branding;
