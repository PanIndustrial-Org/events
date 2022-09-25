import V0_1_0 "./00-01-00-initial/types";
import V0_2_0 "./00-02-00-publisher-entities/types";

module {
  public let Current = V0_2_0;

  public type Args = {};

  public type State = {
    #v0_0_0: { #id; #data: () };
    #v0_1_0: { #id; #data: V0_1_0.State };
    #v0_2_0: { #id; #data: V0_2_0.State };
  };
};