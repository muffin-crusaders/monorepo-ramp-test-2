(() => {
    'use strict';

    /**
     * @ngdoc service
     * @name helpService
     * @module app.ui.help
     * @description
     *
     * The `helpService` service provides stores for help items
     *
     */
    angular
        .module('app.ui.help')
        .service('helpService', helpService);

    function helpService($mdDialog, $http) {
        // all help sections (populated when elements tagged with rv-help are created)
        const registry = [];

        // all help sections currently drawn
        const drawnCache = [];

        const service = {
            register,
            unregister,
            registry,
            drawnCache,
            setDrawn,
            clearDrawn,
            HelpSummaryController
        };

        return service;

        /**
        * Adds an object to the service's registry.
        *
        * @param {Object} object    the object to be added
        */
        function register(object) {
            registry.push(object);
        }

        /**
        * Removes an object from the service's registry.
        *
        * @param {Object} object    the object to be removed
        */
        function unregister(object) {
            const index = registry.indexOf(object);
            if (index !== -1) {
                registry.splice(index, 1);
            }
        }

        /**
        * Adds an object to the service's cache of already drawn help sections.
        *
        * @param {Object} object    the object to be added
        */
        function setDrawn(object) {
            drawnCache.push(object);
        }

        /**
        * Clears the service's cache of already drawn help sections.
        *
        */
        function clearDrawn() {
            drawnCache.length = 0;
        }

        function HelpSummaryController() {
            const self = this;
            self.closeHelpSummary = () => $mdDialog.hide();

            $http.get(`locales/en-CA/translation.json`).then(data => {
                self.sections = Object.keys(data.data.help);
            });

            console.log(self);
        }
    }
})();
