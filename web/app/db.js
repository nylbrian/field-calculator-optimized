'use strict';

angular.module('fieldCalculator')
.config(function($dbProvider) {
  $dbProvider.setName('field-calculator')
    .setSchema({
      version: 2,
      stores: [
        {
          name: 'farmers',
          keyPath: 'storage_id',
          autoIncrement: true,
          indexes: [
            {
              name: 'storage_id',
              keyPath: ['storage_id']
            },
            {
              name: 'first_name',
              keyPath: ['first_name']
            },
            {
              name: 'last_name',
              keyPath: ['last_name']
            },
            {
              name: 'countries_id',
              keyPath: ['countries_id']
            },
            {
              name: 'updatedAt',
              keyPath: 'updatedAt'
            },
          ]
        },
        {
          name: 'countries',
          keyPath: 'storage_id',
          autoIncrement: true,
          indexes: [
            {
              name: 'name',
              keyPath: ['name']
            },
            {
              name: 'updatedAt',
              keyPath: 'updatedAt'
            },
          ]
        },
        {
          name: '_ydn_sync_history', // entity module requires this objectStore
          keyPath: 'sequence',
          autoIncrement: true,
          indexes: [{
            name: 'key',
            keyPath: ['entity', 'id']
          }]
        }
      ]
    });
});
