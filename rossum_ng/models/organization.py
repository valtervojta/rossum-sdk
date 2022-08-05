from typing import List, Optional

from pydantic import Field

from rossum_ng.models.base import Base


class Organization(Base):
    id: int
    name: str
    url: str
    workspaces: List[str]
    users: List[str]
    organization_group: str
    is_trial: bool
    created_at: str
    trial_expires_at: str
    expires_at: Optional[str] = None
    oidc_provider: Optional[str] = None
    ui_settings: dict = Field(default_factory=dict)
    metadata: dict = Field(default_factory=dict)
