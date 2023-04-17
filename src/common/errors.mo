module {
  public let PERMISSION_DENIED = "E10010: Permission denied";

  public let EMPTY_ADMINS_LIST = "E10020: Admins list is empty";

  public let MIGRATION_STATE = "E20010: Unexpected migration state";

  public let CURRENT_MIGRATION_STATE = "E20011: Unexpected current migration state";

  public let EVENT_NAME_LENGTH = "E30010: Event name length limit reached";

  public let FILTER_LENGTH = "E30020: Filter length limit reached";

  public let LISTENERS_LENGTH = "E30030: Listeners length limit reached";

  public let LISTENERS_REPLACE_LENGTH = "E31031: Listeners option length limit reached";

  public let LISTENERS_ADD_LENGTH = "E31032: ListenersAdd option length limit reached";

  public let LISTENERS_REMOVE_LENGTH = "E31033: ListenersRemove option length limit reached";

  public let SUBSCRIPTIONS_LENGTH = "E30040: Subscriptions limit reached";

  public let ACTIVE_SUBSCRIPTIONS_LENGTH = "E30041: Active subscriptions limit reached";
  
  public let SUBSCRIPTIONS_OPTION_LENGTH = "E31042: EventNames option length limit reached";

  public let PUBLICATIONS_LENGTH = "E30050: Publications limit reached";

  public let ACTIVE_PUBLICATIONS_LENGTH = "E30051: Active publications limit reached";
  
  public let PUBLICATIONS_OPTION_LENGTH = "E31052: EventNames option length limit reached";

  public let PUBLISHER_WHITELIST_LENGTH = "E30060: Subscriber witelist length limit reached";

  public let PUBLISHER_WHITELIST_REPLACE_LENGTH = "E31061: PublisherWitelist option length limit reached";

  public let PUBLISHER_WHITELIST_ADD_LENGTH = "E31062: PublisherWitelistAdd option length limit reached";

  public let PUBLISHER_WHITELIST_REMOVE_LENGTH = "E31063: PublisherWitelistRemove option length limit reached";

  public let SUBSCRIBER_WHITELIST_LENGTH = "E30070: Subscriber witelist length limit reached";

  public let SUBSCRIBER_WHITELIST_REPLACE_LENGTH = "E31071: SubscriberWhitelist option length limit reached";

  public let SUBSCRIBER_WHITELIST_ADD_LENGTH = "E31072: SubscriberWhitelistAdd option length limit reached";

  public let SUBSCRIBER_WHITELIST_REMOVE_LENGTH = "E31073: SubscriberWhitelistRemove option length limit reached";

  public let SELF_LISTENER = "E40010: Can not confirm self as listener";

  public let PUBLISHER_NOT_FOUND = "E50010: Publisher not found";

  public let PUBLICATION_NOT_FOUND = "E50020: Publication not found";

  public let SUBSCRIBER_NOT_FOUND = "E50030: Subscriber not found";

  public let SUBSCRIPTION_NOT_FOUND = "E50040: Subscription not found";

  public let EVENT_NOT_FOUND = "E50050: Event not found";

  public let NO_PUBLISHERS_STORE_CANISTERS = "E50060: No PublishersStore canisters available";

  public let NO_SUBSCRIBERS_STORE_CANISTERS = "E50070: No SubscribersStore canisters available";

  public let INACTIVE_CANISTER = "E60010: Canister is inactive";

  public let UPGRADE_IN_PROGRESS = "E60020: Upgrade in progress";

  public let UPGRADE_TYPE = "E60030: Cannot change upgrade type";
};
