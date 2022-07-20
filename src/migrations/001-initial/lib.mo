import MigrationTypes "../types";

module {
  public func upgrade(migrationState: MigrationTypes.State, args: MigrationTypes.Args): MigrationTypes.State {
    let #state000(#data(state)) = migrationState;

    return #state001(#data({
      var admins = [];
      var eventId = 1;
      var subscribers = [];
      var events = [];
    }));
  };

  public func downgrade(migrationState: MigrationTypes.State, args: MigrationTypes.Args): MigrationTypes.State {
    let #state001(#data(state)) = migrationState;

    return #state000(#data);
  };
};